#!/usr/bin/env sh

echo -e "\e[1;34m::\e[1;m Configuring security..."

echo " Enabling PAM support for Gnome keyring."
sed -i "/^auth.*include.*system-local-login$/a auth       optional     pam_gnome_keyring.so" /etc/pam.d/login
sed -i "/^session.*include.*system-local-login$/a session    optional     pam_gnome_keyring.so auto_start" /etc/pam.d/login
