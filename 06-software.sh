#!/usr/bin/env sh

PKGS=(
  # base
  man-db                # man pages reader
  man-pages             # Linux man pages
  ntfs-3g               # NTFS file system driver
  udiskie               # automount removable disks
  reflector             # grab latest pacman mirror list
  pkgfile               # pacman metadata explorer
  whois                 # whois client
  dmidecode             # read system HW info from BIOS
  curl                  # URL retrieval utility
  wget                  # URL retrieval utlity
  rsync                 # remote file sync utility
  bzip2                 # high-quality compression utility
  gzip                  # GNU compression utility
  zip                   # compression utility
  xz                    # compression utility
  tar                   # utility for tar archives
  unrar                 # utility for rar archives
  unzip                 # utility for zip archives

  # terminal
  htop                  # process viewer
  fzy                   # feature complete fuzzy finder
  the_silver_searcher   # code searching tool
  imv                   # image viewer for wayland 
  neofetch              # display system info
  brightnessctl         # brightness control tool

  # virtualization
  qemu                  # machine virtualization
  edk2-ovmf             # enable UEFI support for virtual machines

  # reading and writing
  zathura               # document viewer
  zathura-pdf-poppler   # PDF support for Zathura
  zathura-ps            # PostScript support for Zathura
  texlive-most          # LaTeX (with all option)
  hunspell              # spell checker 
  hunspell-en_US        # US English dictionaries

  # cloud storage tools
  cryfs                 # cryptographic file system for cloud
  rclone                # multi-cloud sync, copy and mount client

  # web
  firefox
  firefox-ublock-origin
  firefox-extension-privacybadger
  firefox-extension-https-everywhere
  firefox-decentraleyes
  firefox-dark-reader
  firefox-tridactyl

  # media
  ffmpeg                # video tools
  mpv                   # media player (optional: celluloid for frontend)

  # other
  thunar                # lightweight file manager
  thunar-volman         # removable devices in Thunar
)
