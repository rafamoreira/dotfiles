#!/bin/sh

# configs for nvidia solo
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto


userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

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


# if [ $1 = "openbox" ]
# then
#   pasystray &
#   exec openbox-session
# elif [ $1 = "awesome" ]
# then
#   exec awesome
# elif [ $1 = "twm" ]
# then
#   exec twm
# elif [ $1 = "i3" ]
# then
#   # /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
#   # /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#   # ~/.fehbg &
#   pasystray &
#   exec i3
# elif [ $1 = "herbs" ]
# then
#   exec herbstluftwm --locked
# elif [ $1 = "xmonad" ]
# then
#   xterm &
#   xmonad
# elif [ $1 == "kde" ]
# then
#   exec startplasma-x11
# elif [ $1 = "mate" ]
# then
#   exec mate-session
# elif [ $1 = "xfce" ]
# then
#   exec startxfce4
# elif [ $1 = "bspwm" ]
# then
#   setxkbmap -option "ctrl:nocaps" br &
#   sh ~/.screenlayout/jupiter-default.sh &
#   sxhkd &
#   exec bspwm
# fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# pasystray &
# exec i3

# setxkbmap -layout "br" -variant "thinkpad" -option "caps:super"
# setxkbmap -layout "us-acentos" 

# Here Xfce is kept as default
session=${1:-i3}

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

udiskie --tray &


case $session in
    i3|i3wm           ) exec pasystray & i3;;
    kde               ) exec startplasma-x11;;
    xfce|xfce4        ) exec startxfce4;;
    xmonad	      ) exec xmonad;;
    bspwm	      ) exec bspwm;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
