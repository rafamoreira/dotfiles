#!/usr/bin/env bash

user_stuff() {
    sudo apt-get -y update
    sudo apt-get -y install git-core curl wget terminator vim-gtk emacs25 stow \
         zsh keychain build-essential cmake python-dev python3-dev
    }

rbenv_stuff() {
    sudo apt update
    sudo apt install libssl-dev libreadline-dev zlib1g-dev build-essential

    RBENV_ROOT="$HOME/.rbenv"
    git clone https://github.com/rbenv/rbenv $RBENV_ROOT
    cd $RBENV_ROOT

    git clone https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build
    git clone https://github.com/rkh/rbenv-whatis.git $RBENV_ROOT/plugins/rbenv-whatis
    git clone https://github.com/rkh/rbenv-use.git $RBENV_ROOT/plugins/rbenv-use
    
    cd $RBENV_ROOT && src/configure && make -C src

    }


for var in "$@"
do
    if [ $var = "rbenv" ]
    then
        rbenv_stuff
    elif [ $var = "user_stuff" ]
    then
        user_stuff
    fi
done
        
       
