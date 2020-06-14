#!/usr/bin/env sh

echo ":: Configuring sway..."

HOME_DIR="/home/${USERNAME}"

echo " Generating sway sample configuration."
sudo -u $USERNAME mkdir -p ${HOME_DIR}/.config/sway
cp /etc/sway/config ${HOME_DIR}/.config/sway/config
chown $USERNAME:$USERNAME ${HOME_DIR}/.config/sway/config

echo " Creating XDG user directories."
sudo -u $USERNAME mkdir -p ${HOME_DIR}/{documents,downloads,music,pictures,videos}

echo ":: Configuring fish..."

echo " Setting fish as default shell."
chsh -s /usr/bin/fish $USERNAME > /dev/null 2>&1

echo " Removing bash configuration files."
[ -f ${HOME_DIR}/.bashrc ] && rm ${HOME_DIR}/.bashrc
[ -f ${HOME_DIR}/.bash_logout ] && rm ${HOME_DIR}/.bash_logout
[ -f ${HOME_DIR}/.bash_profile ] && rm ${HOME_DIR}/.bash_profile
