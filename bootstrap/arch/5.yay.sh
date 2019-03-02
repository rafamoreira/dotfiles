#!/bin/bash
cd ~/Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
