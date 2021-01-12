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

# Faster typing and repeating
xset r rate 200 40 &

# Wallpaper
# betterlockscreen -w &

# keyboard shortcuts
# sxhkd &

# clipboard management
# CM_HISTLENGTH=10 CM_LAUNCHER=rofi clipmenud &

# disappear the mouse
# xbanish &

# authentication agent
# /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# Started in i3 for system tray support
# dunst &  # notifications
# mathpix-snipping-tool &  # latex snipping
# nm-applet &  # network manager
# redshift &  # better looking screen

# Starting ssh agent
eval $(ssh-agent)

# Start i3, nothing will execute after this
exec i3
