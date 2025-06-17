#!/bin/bash
set -e

echo "=== Arch Linux Ansible Bootstrap Script ==="

# Update system first
echo "Updating system packages..."
sudo pacman -Syu --noconfirm

# Install required packages for Ansible
echo "Installing Ansible and Git..."
sudo pacman -S --needed --noconfirm ansible git

# Clone dotfiles repository
DOTFILES_DIR="$HOME/dotfiles"
if [ -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory already exists, pulling latest changes..."
    cd "$DOTFILES_DIR"
    git pull
else
    echo "Cloning dotfiles repository..."
    git clone https://github.com/rafamoreira/dotfiles.git "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

# Run the Ansible playbook
# echo "Running Ansible playbook..."
# ansible-playbook -i inventory.yml playbook.yml --ask-become-pass
# 
# echo "=== Bootstrap complete! ==="
