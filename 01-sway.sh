#!/usr/bin/env sh

PKGS=(
  # base
  wayland                       # display server
  mesa                          # 3D graphics library
  noto-fonts                    # Google TTF font package
  sway                          # Wayland compositor

  # extra
  alacritty                     # GPU-accelerated terminal
  fish                          # fish shell
  gtk3                          # GUI toolkit
  grim                          # screenshot utility
  slurp                         # region selection
  wofi                          # launcher
  mako                          # notification daemon
  swayidle                      # idle management daemon
  swaylock                      # screen locker
  wl-clipboard                  # coyp/paste utility

  # extra fonts
  adobe-source-code-pro-fonts   # monospaced font for coding
  ttf-font-awesome              # font awesome for icons
  noto-fonts-emoji              # Google noto emoji fonts
)
