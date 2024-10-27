#!/usr/bin/env bash

NODENV_ROOT="$HOME/.nodenv"

git clone https://github.com/nodenv/nodenv.git $NODENV_ROOT

cd $NODENV_ROOT

git clone https://github.com/nodenv/node-build.git $NODENV_ROOT/plugins/node-build
git clone https://github.com/nodenv/node-build-update-defs.git $NODENV_ROOT/plugins/node-build-update-defs

cd $NODENV_ROOT && src/configure && make -C src

touch $HOME/.config/using-nodenv
