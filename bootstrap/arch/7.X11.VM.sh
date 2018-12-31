#!/bin/bash
sudo pacman -Syu
sudo pacman -S terminator emacs ttf-dejavu

# this is total shit but I do not want some complex checks everytime I fire the
# the terminal to see if I'm running a VM, so cowboy we go.

touch ~/this-is-a-vm

sudo systemctl enable sshd.service
sudo systemctl start sshd.service
