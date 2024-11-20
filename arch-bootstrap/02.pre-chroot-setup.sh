#!/bin/bash

# load the correct keymap
loadkeys us
# set time and date
timedatectl set-ntp true

# pacstrap
curl -o /etc/pacman.d/mirrorlist "https://archlinux.org/mirrorlist/?country=DK&protocol=http&protocol=https&ip_version=4&use_mirror_status=on"
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-headers lvm2 neovim git iwd

# fstab
genfstab -U /mnt >> /mnt/etc/fstab

cd /mnt/root
git clone https://github.com/rafamoreira/dotfiles.git
arch-chroot /mnt
