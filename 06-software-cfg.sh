#!/usr/bin/env sh

echo -e "\e[1;34m::\e[1;m Configuring software..."

echo " Updating pkgfile database."
pkgfile --update > /dev/null 2>&1

echo " Updating fish completions."
sudo -u $USERNAME fish --command=fish_update_completions > /dev/null 2>&1
