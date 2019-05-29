#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
background_image=${background_image:-~/.dwm-background}

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

if [[ $(uname -r | grep ARCH) ]]; then
        usermodmap=$HOME/.Xmodmap
        if [ -f "$usermodmap" ]; then
                xmodmap $usermodmap
        fi
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset r rate 200 40 &

xbindkeys &
redshift &
slstatus &
clipmenud &
xbanish &
feh --bg-scale $background_image

exec dwm
