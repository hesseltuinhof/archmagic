#!/usr/bin/env sh

echo ":: Configuring software..."

echo " Updating pkgfile database."
pkgfile --update > /dev/null 2>&1

echo " Updating fish completions."
sudo -u $USERNAME fish --command=fish_update_completions > /dev/null 2>&1
