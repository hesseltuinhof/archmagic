#!/usr/bin/env sh

pacman -S --noconfirm gtk-layer-shell > /dev/null 2>&1
pacman -S --noconfirm rust > /dev/null 2>&1

git clone https://git.sr.ht/~kennylevinsen/greetd /usr/local/src/greetd > /dev/null 2>&1
cd /usr/local/src/greetd/
git checkout 0.6.1 > /dev/null 2>&1

cargo build --release
cp target/release/greetd /usr/local/bin/
cp greetd.service /etc/systemd/system/

mkdir /etc/greetd

useradd -r -G video -s /usr/bin/nologin greeter
chown -R greeter:greeter /etc/greetd/

git clone https://git.sr.ht/~kennylevinsen/gtkgreet /usr/local/src/gtkgreet > /dev/null 2>&1
cd /usr/local/src/gtkgreet/
git checkout 0.6 > /dev/null 2>&1

meson -Dlayershell=true build
ninja -C build
ninja -C build install

cat << EOF > /etc/greetd/config.toml
[terminal]
vt = 1

[default_session]
command = "sway --config /etc/greetd/gtkgreet-sway-config"
user = "greeter"
EOF

cat << EOF > /etc/greetd/gtkgreet-sway-config
# '-l' activates layer-shell mode. Notice that 'swaymsg exit' will run after gtkgreet.
exec "gtkgreet -l; swaymsg exit"

bindsym Mod1+shift+e exec swaynag \
    -t warning \
    -m 'What do you want to do?' \
    -b 'Poweroff' 'systemctl poweroff' \
    -b 'Reboot' 'systemctl reboot'

include /etc/sway/config.d/*
EOF

cat << EOF > /etc/greetd/environments
sway
fish
EOF

systemctl enable greetd > /dev/null 2>&1
