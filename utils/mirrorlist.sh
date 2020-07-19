#!/usr/bin/env sh

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
curl -s \
  "https://www.archlinux.org/mirrorlist/?country=AT&country=IE&country=NL&country=CH&country=GB&protocol=https&ip_version=4" \
  | sed -e "s/^#Server/Server/" -e "/^#/d" \
  > /etc/pacman.d/mirrorlist
pacman -Syyu
