#!/bin/bash

mkdir -p ~/.local/opt
sudo pacman -S i3blocks
cd ~/.local/opt
git clone https://github.com/vivien/i3blocks-contrib.git
