#!/usr/bin/env bash 

sudo apt-get update
sudo apt-get install -y \
  curl


curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
