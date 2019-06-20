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


if [[ $1 == "openbox" ]]
then
  pasystray &
  exec openbox-session
elif [[ $1 == "awesome" ]]
then
  exec awesome
elif [[ $1 == "twm" ]]
then
  exec twm
elif [[ $1 == "i3" ]]
then
  /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
  ~/.fehbg &
  pasystray &
  exec i3
elif [[ $1 == "herbs" ]]
then
  exec herbstluftwm --locked
elif [[ $1 == "xmonad" ]]
then
  xterm &
  xmonad
elif [[ $1 == "kde" ]]
then
  exec startkde
elif [[ $1 == "mate" ]]
then
  exec mate-session
elif [[ $1 == "xfce" ]]
then
  exec startxfce4
elif [[ $1 == "bspwm" ]]
then
  exec bspwm
fi
