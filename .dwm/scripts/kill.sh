#!/usr/bin/env bash

# Prompt the user
choice=$(printf "Quit\ndo nothing" | rofi -theme "$HOME/.config/rofi/powermenu/type-1/style-5.rasi" -dmenu -p "Quit dwm?" -lines 2 -selected-row 1)

# If the user pressed Esc or closed rofi, $choice will be empty
if [ "$choice" = "Quit" ]; then
  # Terminate dwm gracefully
  pkill -TERM swm
fi
