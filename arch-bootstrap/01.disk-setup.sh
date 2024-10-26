#!/bin/bash

#!/bin/bash

# Device configuration
DEVICE="/dev/nvme0n1"
BOOT_PARTITION="${DEVICE}p1"
LVM_PARTITION="${DEVICE}p2"

# Size configuration
BOOT_SIZE="1G"
BOOT_START="1MiB"
BOOT_END="${BOOT_SIZE}"
LVM_START="${BOOT_SIZE}"
LVM_END="100%"

# LVM configuration
CRYPT_LVM_NAME="cryptlvm"
VOLUME_GROUP="vg0"
SWAP_SIZE="64G"

# Mount points
BOOT_MOUNTPOINT="/mnt/boot"
ROOT_MOUNTPOINT="/mnt"

# Check root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Verify device exists
if [ ! -b "$DEVICE" ]; then
    echo "Error: Device $DEVICE not found"
    exit 1
fi

# Safety confirmation
echo "WARNING: This will erase all data on $DEVICE"
echo "Boot partition: $BOOT_PARTITION (${BOOT_SIZE})"
echo "System partition: $LVM_PARTITION"
read -p "Continue? (y/N): " confirm
if [ "${confirm,,}" != "y" ]; then
    echo "Aborted"
    exit 1
fi

# Create partition table
parted -s $DEVICE mklabel gpt

# Create partitions
parted -s $DEVICE \
    mkpart primary fat32 $BOOT_START $BOOT_END \
    mkpart primary $LVM_START $LVM_END \
    set 1 esp on

# Format boot partition
mkfs.fat -F32 $BOOT_PARTITION

# Format and set up LUKS on the LVM partition
cryptsetup luksFormat $LVM_PARTITION 
cryptsetup luksOpen $LVM_PARTITION $CRYPT_LVM_NAME

# Create LVM physical volume, volume group, and logical volumes
pvcreate /dev/mapper/$CRYPT_LVM_NAME
vgcreate $VOLUME_GROUP /dev/mapper/$CRYPT_LVM_NAME

lvcreate -L $SWAP_SIZE -n swap $VOLUME_GROUP
lvcreate -l +100%FREE -n archroot $VOLUME_GROUP

mkswap /dev/mapper/$VOLUME_GROUP-swap
swapon /dev/mapper/$VOLUME_GROUP-swap
mount /dev/mapper/$VOLUME_GROUP-archroot /mnt
mkdir -p /mnt/boot
mount $BOOT_PARTITION /mnt/boot

echo "Partitioning and setup complete."

