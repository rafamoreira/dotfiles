#!/bin/bash

# load the correct keymap
loadkeys us

# set time and date
timedatectl set-ntp true

echo "danger ZONE "
echo "mbrsda || hyper-v || physical || lvm? "

#!/bin/bash

# Target partitions
EFI_PARTITION="/dev/nvme0n1p1"
BOOT_PARTITION="/dev/nvme0n1p2"
LVM_PARTITION="/dev/nvme0n1p3"

CRYPT_LVM_NAME="cryptlvm"
VOLUME_GROUP="vg0"
SWAP_SIZE="64G"

# Check if the user is root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Format the EFI partition as FAT32
mkfs.fat -F32 $EFI_PARTITION

# Format the /boot partition as ext4
mkfs.ext4 $BOOT_PARTITION

# Format and set up LUKS on the LVM partition
cryptsetup luksFormat $LVM_PARTITION
cryptsetup luksOpen $LVM_PARTITION $CRYPT_LVM_NAME

# Create LVM physical volume, volume group, and logical volumes
pvcreate /dev/mapper/$CRYPT_LVM_NAME
vgcreate $VOLUME_GROUP /dev/mapper/$CRYPT_LVM_NAME

lvcreate -L $SWAP_SIZE -n swap $VOLUME_GROUP
lvcreate -l +100%FREE -n arch_root $VOLUME_GROUP

echo "Partitioning and setup complete."


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
