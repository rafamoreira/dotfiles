#!/bin/bash

install_dir="$HOME/dotfiles"

neovim_dir="$install_dir/nvim"

# neovim
ln -s $neovim_dir "$HOME/.config/nvim"
