#!/bin/bash

IN="LVDS1"
EXT="HDMI1"
EXT2="VGA1"

if (xrandr | grep "$EXT disconnected"); then
    xrandr --output $EXT2 --off
    xrandr --output $IN --auto --output $EXT --off
else
    xrandr --output $IN --off --output $EXT --auto --primary --output $EXT2 --auto --left-of $EXT
    #xrandr --output $IN --auto --output $EXT --auto --primary
fi
