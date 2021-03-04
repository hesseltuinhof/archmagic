#!/usr/bin/env sh

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
curl -s \
  "https://archlinux.org/mirrorlist/?country=DE&country=NL&country=NL&protocol=https&use_mirror_status=on" \
  | sed -e "s/^#Server/Server/" -e "/^#/d" \
  > /etc/pacman.d/mirrorlist
pacman -Syyu
