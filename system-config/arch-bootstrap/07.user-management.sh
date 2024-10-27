#!/bin/bash
pacman -S zsh git stow sudo
echo "type username: "
read user
useradd -m -s /bin/zsh $user
passwd $user
usermod -aG wheel,users,disk,storage $user
echo "%wheel ALL=ALL NOPASSWD: ALL" >> /etc/sudoers
