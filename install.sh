#!/usr/bin/env sh

USERNAME=""

PKG_DIR="./"
CFG_DIR="./"
SCRIPT_DIR="./"

E_PKG_FILE_NOT_EXIST=64
E_CFG_FILE_NOT_EXIST=65
E_SCRIPT_FILE_NOT_EXIST=66
E_NON_ROOT=70
E_EMPTY_USERNAME=71
E_USERNAME_NOT_EXIST=72

install_pkgs() {
  if [ -e "$1" ]; then
    echo -e "\e[1;34m::\e[1;m Installing ${1}..."
    source "${PKG_DIR}${1}"

    n_failed=0
    n_ok=0
    for PKG in "${PKGS[@]}"; do
      pacman -S --asexplicit --noconfirm $PKG > /dev/null 2>&1
      if [ "$?" -eq 0 ]; then
        echo -e " [   \e[1;32mOK\e[1;m   ] ${PKG}"
        n_ok=$((n_ok+1))
      else
        echo -e " [ \e[1;31mFAILED\e[1;m ] ${PKG}"
        n_failed=$((n_failed+1))
      fi
    done
    echo " Summary: ${n_ok} packages installed and ${n_failed} failed"
  else
    exit $E_PKG_FILE_NOT_EXIST
  fi
}

install_script() {
  if [ -e "$1" ]; then
    echo -e "\e[1;34m::\e[1;m Installing ${1}..."
    source "${SCRIPT_DIR}${1}"
  else
    exit $E_SCRIPT_FILE_NOT_EXIST
  fi
}

configure() {
  if [ -e "$1" ]; then
    source "${CFG_DIR}${1}"
  else
    exit $E_CFG_FILE_NOT_EXIST
  fi
}

if [ $(id -u) -ne 0 ]; then
  echo "Only root can run this script. Please use sudo."
  exit $E_NON_ROOT
fi

if [ -z "${USERNAME}" ]; then
  echo "Specify local username for configuration."
  exit $E_EMPTY_USERNAME
fi

if [ -z $(id -u ${USERNAME} 2>/dev/null) ]; then
  echo "User not exists"
  exit $E_USERNAME_NOT_EXIST
fi

install_pkgs "01-sway.sh"
configure "01-sway-cfg.sh"

install_pkgs "02-networking.sh"
configure "02-networking-cfg.sh"

install_pkgs "03-multimedia.sh"

install_pkgs "04-security.sh"
configure "04-security-cfg.sh"

install_pkgs "05-development.sh"

install_pkgs "06-software.sh"
configure "06-software-cfg.sh"

install_script "07-greetd.sh"
install_script "08-pyenv.sh"

exit 0
