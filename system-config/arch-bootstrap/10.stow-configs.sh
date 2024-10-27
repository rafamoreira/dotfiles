#!/bin/bash
mkdir -p $HOME/.config
cd $HOME/dotfiles
stow alacritty
stow i3
stow neovim
