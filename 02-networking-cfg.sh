#!/usr/bin/env sh

echo ":: Configuring networking..."

echo " Enabling NetworkManager daemon."
systemctl enable --now NetworkManager.service > /dev/null 2>&1

echo " Enabling network time clock."
sed -i "s/#FallbackNTP=/NTP=/g" /etc/systemd/timesyncd.conf
sed -i "s/#NTP=/#FallbackNTP=/g" /etc/systemd/timesyncd.conf
systemctl enable --now systemd-timesyncd.service > /dev/null 2>&1

echo ":: Configuring bluetooth..."

echo " Adding user to lp group."
usermod -a -G lp $USERNAME

echo " Enabling Bluetooth daemon."
systemctl enable --now bluetooth.service > /dev/null 2>&1

echo " Enabling auto power-on after boot."
sed -i "s/#AutoEnable=false/AutoEnable=true/g" /etc/bluetooth/main.conf
