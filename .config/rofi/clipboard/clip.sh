#!/usr/bin/env bash

THEME_PATH="~/.config/rofi/clipboard/clipboard.rasi"
# Execute the command with Rofi using the specified theme
cliphist list | rofi -dmenu -theme "$THEME_PATH" | cliphist decode | wl-copy
