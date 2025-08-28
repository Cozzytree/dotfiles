xset r rate 200 40 &
dunst &
picom &

export QT_IM_MODULE=fcitx
export QQT_QPA_PLATFORM=xcb
# xsettingsd --config="../xsettingsd" >/dev/null 2>&1

dwmblocks &
feh --bg-fill ~/Pictures/space.jpg &
blueman-applet &
nm-applet &
redshift -x &
sleep 1
redshift -O 2700 &
clipcatd
