#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f ~/.Xresources ]; then
  xrdb -merge ~/.Xresources
fi

if [ -f ~/.Xmodmap ]; then
  xmodmap .Xmodmap
fi

export TERM=xterm-256color
export EDITOR=vim
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

#xscreensaver -no-splash &
#mpd
exec awesome
