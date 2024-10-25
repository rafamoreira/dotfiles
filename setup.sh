#!/bin/bash

# This script is used to setup things that cannot be handle by stow
sudo ln -sf $HOME/dotfiles/xorg/etc/X11/xorg.conf /etc/X11/xorg.conf

sudo ln -sf $HOME/dotfiles/NetworkManager/conf.d/wifi-band-preference.conf /etc/NetworkManager/conf.d/wifi-band-preference.conf
