#!/bin/bash

# load the correct keymap
loadkeys br-abnt2

# set time and date
timedatectl set-ntp true

echo "danger ZONE "
echo "mbrsda || hyper-v || physical || lvm? "

read mtype
if [ $mtype == "mbrsda" ]
then
  # partitions ##### EXTRA CAREFUL ######
  # vmware settings
  mkfs.ext4 /dev/sda1
  mount /dev/sda1 /mnt
elif [ $mtype == "sda" ]
then
  mkfs.fat -F32 /dev/sda1
  mkfs.ext4 /dev/sda2
  mount /dev/sda2 /mnt
  mkdir -p /mnt/boot/efi
  mount /dev/sda1 /mnt/boot/efi
elif [ $mtype == "nvme" ]
then
  mkfs.fat -F32 /dev/nvme0n1p1
  mkfs.ext4 /dev/nvme0n1p2
  mkswap /dev/nvme0n1p3
  swapon /dev/nvme0n1p3

  # mount 
  mount /dev/nvme0n1p2 /mnt
  mkdir /mnt/boot
  mount /dev/nvme0n1p1 /mnt/boot
elif [ $mtype == "lvm" ]
then
  mkfs.fat -F32 /dev/nvme0n1p1
  mkfs.ext4 /dev/mapper/VG0-LVarchroot
  mkfs.ext4 /dev/mapper/VG0-LVhome

  # mount
  mount /dev/mapper/VG0-LVarchroot /mnt
  mkdir -p /mnt/boot/efi
  mount /dev/nvme0n1p1 /mnt/boot/efi
  mkdir /mnt/home
  mount /dev/mapper/VG0-LVhome /mnt/home
fi


# pacstrap
curl -o /etc/pacman.d/mirrorlist "https://www.archlinux.org/mirrorlist/?country=BR&protocol=http&protocol=https&ip_version=4&use_mirror_status=on"
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel vim 

# fstab
genfstab -U /mnt >> /mnt/etc/fstab

cd /mnt/root
wget https://raw.githubusercontent.com/rafamoreira/dotfiles/master/bootstrap/arch/sys-install/2.post-chroot-install.sh
chmod +x /mnt/root/2.post-chroot-install.sh
wget https://raw.githubusercontent.com/rafamoreira/dotfiles/master/bootstrap/arch/sys-install/3.first-boot-install.sh
chmod +x /mnt/root/3.first-boot-install.sh

arch-chroot /mnt
