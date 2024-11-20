#!/bin/bash
sudo pacman -Syu
sudo pacman -S bumblebee bbswitch
sudo gpasswd -a $USER bumblebee
sudo systemctl enable bumblebeed.service
