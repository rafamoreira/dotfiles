#!/usr/bin/env bash

sudo apt update
sudo apt install -y \
  python python-gtk2 python-xlib python-dbus python-wnck python-setuptools

QUICKTILE_INSTALL="$HOME/opt/quicktile"
git clone https://github.com/ssokolow/quicktile.git $QUICKTILE_INSTALL
