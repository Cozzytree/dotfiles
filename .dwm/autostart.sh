#!/bin/sh
xset r rate 200 30 &
dunst &
picom &
dwmblocks &
feh --bg-fill `cat ~/.dwm/current_wallpaper` &
blueman-applet &
nm-applet &
redshift -x &
sleep 1

xrandr -s 1920x1080
redshift -O 2700 &
clipmenud &
