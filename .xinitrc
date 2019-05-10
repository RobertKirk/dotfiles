#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
usermodmap=$HOME/.Xmodmap
sysmodmap=/etc/X11/xinit/.Xmodmap

export PATH="$HOME/.local/bin:$PATH"

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
        xmodmap $usermodmap
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset r rate 200 40 &

sxhkd &
redshift &
slstatus &
clipmenud &
xbanish &
mathpix-snipping-tool &
betterlockscreen -w &
dunst &

exec i3
