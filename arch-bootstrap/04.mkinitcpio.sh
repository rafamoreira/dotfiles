#!/bin/bash

# Script to configure mkinitcpio.conf for encrypted LVM2 with systemd
# Requires root privileges

set -euo pipefail

MKINITCPIO_CONF="/etc/mkinitcpio.conf"
BACKUP_SUFFIX=".backup-$(date +%Y%m%d-%H%M%S)"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Create backup of original configuration
cp "$MKINITCPIO_CONF" "${MKINITCPIO_CONF}${BACKUP_SUFFIX}"
echo "Created backup at ${MKINITCPIO_CONF}${BACKUP_SUFFIX}"

# Function to modify HOOKS line
configure_hooks() {
    # Required hooks for encrypted LVM2 with systemd
    NEW_HOOKS="base systemd autodetect microcode modconf kms keyboard sd-vconsole block sd-encrypt lvm2 filesystems fsck"
    
    # Replace existing HOOKS line or add if not present
    if grep -q '^HOOKS=' "$MKINITCPIO_CONF"; then
        sed -i "s|^HOOKS=.*|HOOKS=(${NEW_HOOKS})|" "$MKINITCPIO_CONF"
    else
        echo "HOOKS=(${NEW_HOOKS})" >> "$MKINITCPIO_CONF"
    fi
}

# Function to ensure required binaries are included
configure_binaries() {
    REQUIRED_BINARIES="cat kbd"
    
    if grep -q '^BINARIES=' "$MKINITCPIO_CONF"; then
        # Append to existing BINARIES if not already present
        sed -i "s|^BINARIES=(\(.*\))|BINARIES=(\1 ${REQUIRED_BINARIES})|" "$MKINITCPIO_CONF"
    else
        echo "BINARIES=(${REQUIRED_BINARIES})" >> "$MKINITCPIO_CONF"
    fi
}

# Apply configurations
echo "Configuring mkinitcpio.conf..."
configure_hooks
# configure_binaries

# Clean up any duplicate entries
sed -i 's/  */ /g' "$MKINITCPIO_CONF"  # Remove multiple spaces
sed -i 's/ )/)/g' "$MKINITCPIO_CONF"   # Remove space before closing parenthesis
sed -i 's/( /(/g' "$MKINITCPIO_CONF"   # Remove space after opening parenthesis

echo "Configuration complete. New hooks configuration:"
grep '^HOOKS=' "$MKINITCPIO_CONF"

mkinitcpio -P

# Check if systemd-boot is installed
if [ -d "/boot/EFI/systemd" ]; then
    echo -e "\nSystemd-boot detected. Don't forget to update your loader entries"
    echo "with the appropriate kernel parameters for encryption."
fi
