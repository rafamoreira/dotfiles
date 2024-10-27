#!/bin/bash

# paru
# Check and install paru
if ! command -v paru &> /dev/null; then
	sudo pacman -S --needed base-devel
	git clone https://aur.archlinux.org/paru.git /tmp/paru
	cd /tmp/paru
	makepkg -si
fi

# paru stuff
paru -S --needed 1password xcwd
# pacman
sudo pacman -S --needed --noconfirm polkit-gnome gnome-keyring libsecret libgnome-keyring x11-ssh-askpass 
