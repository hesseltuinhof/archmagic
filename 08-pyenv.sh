#!/usr/bin/env sh

# install pyenv
curl -sL https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer \
  | sudo -u $USERNAME sh \
  > /dev/null 2>&1
