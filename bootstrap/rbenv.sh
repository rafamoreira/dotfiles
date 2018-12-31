#!/usr/bin/env bash

RBENV_ROOT="$HOME/.rbenv"

git clone https://github.com/rbenv/rbenv $RBENV_ROOT

cd $RBENV_ROOT

git clone https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build
git clone https://github.com/rkh/rbenv-whatis.git $RBENV_ROOT/plugins/rbenv-whatis
git clone https://github.com/rkh/rbenv-use.git $RBENV_ROOT/plugins/rbenv-use
git clone https://github.com/rbenv/rbenv-vars.git $RBENV_ROOT/plugins/rbenv-vars

cd $RBENV_ROOT && src/configure && make -C src

touch $HOME/using-rbenv
