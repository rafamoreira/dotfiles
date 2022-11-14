#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

export SSH_AUTH_SOCK 

#setxkbmap -layout "br" -variant "thinkpad" -option "caps:super"
#setxkbmap -layout "br" -option "ctrl:nocaps"
setxkbmap -layout "us-acentos" -option "ctrl:nocaps"

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# disk utility
udiskie --tray &

# autostart utility
dex -a &

pasystray &

xmodmap $HOME/.xmodmap

# config from arch wiki
# Here i3 is kept as default
session=${1:-i3}
case $session in
    i3|i3wm           ) exec i3;;
    kde               ) exec startplasma-x11;;
    xfce|xfce4        ) exec startxfce4;;
    xmonad            ) exec xmonad;;
    bspwm             ) exec bspwm;;
    awesome	      ) exec awesome;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
