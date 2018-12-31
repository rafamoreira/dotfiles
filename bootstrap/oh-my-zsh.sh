#!/bin/bash

ZSH=~/.oh-my-zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH

ln -s ~/dotfiles/zsh.ohmyzsh/.zshrc ~/.zshrc

ln -s ~/dotfiles/zsh.custom/themes/spaceship-prompt/spaceship.zsh-theme ~/dotfiles/zsh.custom/themes/spaceship.zsh-theme
