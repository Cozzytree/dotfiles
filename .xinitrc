#!/bin/bash

# XDG environment
export XDG_CURRENT_DESKTOP=dwm
export XDG_SESSION_TYPE=x11
export XDG_SESSION_DESKTOP=dwm

# Theming
export QT_QPA_PLATFORMTHEME=qt5ct   # for Qt5
export QT_IM_MODULE=fcitx
export QT_QPA_PLATFORM=xcb
export GTK_THEME=adw-gtk3-dark
export ICON_THEME=candy-icons
export XDG_MENU_PREFIX=plasma-

# Start a dbus session if not already running
if command -v dbus-update-activation-environment >/dev/null 2>&1; then
    eval $(gnome-keyring-daemon --start --components=secrets,pkcs11,ssh,gpg)  # START keyring before DBus update
    export SSH_AUTH_SOCK
    export GNOME_KEYRING_CONTROL
    export GNOME_KEYRING_PID
    dbus-update-activation-environment --all
    sleep 1 && dbus-update-activation-environment --systemd DISPLAY XDG_CURRENT_DESKTOP # Some fix idk
fi
# Input method
fcitx5 &

# Start polkit agent (try different ones in fallback order)
if command -v /usr/lib/polkit-kde-authentication-agent-1 >/dev/null 2>&1; then
    /usr/lib/polkit-kde-authentication-agent-1 &
elif command -v /usr/libexec/polkit-kde-authentication-agent-1 >/dev/null 2>&1; then
    /usr/libexec/polkit-kde-authentication-agent-1 &
elif command -v /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null 2>&1; then
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
elif command -v /usr/libexec/polkit-gnome-authentication-agent-1 >/dev/null 2>&1; then
    /usr/libexec/polkit-gnome-authentication-agent-1 &
fi

# Start xsettingsd if you want
xsettingsd --config="$HOME/xsettingsd" >/dev/null 2>&1 &

# exec dbus-run-session dwm
exec dwm
