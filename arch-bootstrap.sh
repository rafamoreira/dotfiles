#!/bin/bash

# Install required packages if not present
if ! command -v ansible &> /dev/null; then
    sudo pacman -S ansible --noconfirm
fi

# Run ansible playbook
cd "$(dirname "$0")/ansible"
ansible-playbook -i inventory/hosts site.yml
