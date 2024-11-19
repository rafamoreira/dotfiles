#!/bin/sh -e

# Install syncthingtray, preventing conflicts
# Pass -git as argument to install the git version with dependencies
pacman -Qq | grep '^syncthingtray' | xargs -r paru --noconfirm -R
suffix=$1
paru --noconfirm -Syy --nobatchinstall boost c++utilities$suffix qtforkawesome$suffix qtutilities$suffix
paru --noconfirm -S syncthingtray$suffix

