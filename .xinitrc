#!/bin/bash
export XDG_CURRENT_DESKTOP=dwm
export XDG_SESSION_TYPE=x11
export XDG_SESSION_DESKTOP=dwm

export QT_QPA_PLATFORMTHEME=qt5ct   # for Qt5
export QT_STYLE_OVERRIDE=kvantum
# export QT_QPA_PLATFORMTHEME=qt6ct   # for Qt6
export QT_IM_MODULE=fcitx
export QT_QPA_PLATFORM=xcb
export GTK_THEME=adw-gtk3-dark
export ICON_THEME=candy-icons
export QT_QPA_PLATFORMTHEME=kde
export XDG_MENU_PREFIX=plasma-

xsettingsd --config="~/xsettingsd" >/dev/null 2>&1

exec dbus-run-session dwm
