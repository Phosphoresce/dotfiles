#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xscreensaver -no-splash &
ibus-daemon -drx
exec awesome
