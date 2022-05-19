#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# load $XDG_CONFIG_HOME/X11/xprofile file if it exists; otherwise, load ~/.xprofile
[ -f "$XDG_CONFIG_HOME"/X11/xprofile ] && source "$XDG_CONFIG_HOME"/X11/xprofile || source ~/.xprofile

# setxkbmap -option caps:escape
# Make Caps Lock an additional Esc and both Shift Keys toggle Caps Lock
setxkbmap -option caps:escape,shift:both_capslock &

# start dwm
exec dwm
