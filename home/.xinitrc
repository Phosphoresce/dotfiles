#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xscreensaver -no-splash &
eval $(ssh-agent) >/dev/null
#ssh-add /path/to/keys/*.pem
ibus-daemon -drx
exec awesome
