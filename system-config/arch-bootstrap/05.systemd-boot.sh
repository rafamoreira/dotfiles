#!/bin/bash

bootctl install

mkdir -p /boot/loader
cat << 'EOF' > /boot/loader/loader.conf
default		arch.conf
timeout		4
console-mode	max
editor          yes
EOF

mkdir -p /boot/loader/entries
cat << 'EOF' > /boot/loader/entries/arch.conf
title   Arch BTW!
linux   /vmlinuz-linux
initrd  /initramfs-linux.img
options root=rd.luks.name=135bb426-6120-43fb-a779-7a9e21d60a43=cryptlvm root=/dev/vg0/archroot rw
EOF
