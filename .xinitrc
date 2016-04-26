#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xscreensaver -no-splash &
exec awesome
