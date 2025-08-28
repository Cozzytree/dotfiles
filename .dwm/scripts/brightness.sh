#!/bin/bash

step=5

# Parse argument
case "$1" in
  up)
    brightnessctl set +${step}%
    ;;
  down)
    brightnessctl set ${step}%-  # Decrease brightness
    ;;
  *)
    echo "Usage: $0 {up|down}"
    exit 1
    ;;
esac

pkill -RTMIN+10 dwmblocks

# Get current brightness percentage
brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
brightness_percent=$((brightness * 100 / max_brightness))

# Send notification
dunstify -a "changeBrightness" -u low -i display-brightness \
  -h string:x-dunst-stack-tag:mybrightness \
  -h int:value:"$brightness_percent" "Brightness: ${brightness_percent}%"
