#!/usr/bin/env sh

PKGS=(
  pipewire              # sound/video server
  pipewire-pulse        # replaces pulseaudio{-bluetooth}
  alsa-utils            # amixer and alsamixer
  pavucontrol           # volume control GUI

  # screen sharing
  xdg-desktop-portal
  xdg-desktop-portal-wlr
  pipewire-media-session
)
