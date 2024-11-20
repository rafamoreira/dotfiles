#!/bin/bash
# 
pacman -Syu
pacman -S zsh git stow

echo "type username: "
read user
useradd -m -s /bin/zsh $user
passwd $user
usermod -aG wheel,users,disk,storage $user
su $user -c "git clone https://github.com/rafamoreira/dotfiles.git /home/$user/dotfiles"

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
