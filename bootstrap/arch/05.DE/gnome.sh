#!/bin/bash
sudo pacman -Syu
sudo pacman -S gnome gnome-extra
sudo systemctl enable gdm.service
