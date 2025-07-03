#!/bin/bash
set -e

echo "=== Arch Bootstrap Script ==="

# Update system
sudo pacman -Syu --noconfirm

# Install essential packages for Ansible
sudo pacman -S --needed --noconfirm \
    ansible

