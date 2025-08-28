#!/bin/bash

# Get the default sink
sink=$(pactl get-default-sink)

# Set the volume change step (in %)
step=5

# Get current volume (as integer)
volume=$(pactl get-sink-volume "$sink" | grep -oP '\d+%' | head -1 | tr -d '%')

# Parse argument
case "$1" in
  up)
    pactl set-sink-volume "$sink" +${step}%
    ;;
  down)
    pactl set-sink-volume "$sink" -${step}%
    ;;
  mute)
    pactl set-sink-mute "$sink" toggle
    ;;
  *)
    echo "Usage: $0 {up|down|mute}"
    exit 1
    ;;
esac

# Get updated volume
volume=$(pactl get-sink-volume "$sink" | grep -oP '\d+%' | head -1 | tr -d '%')

# Send notification
dunstify -a "changeVolume" -u low -i audio-volume-high \
  -h string:x-dunst-stack-tag:myvolume \
  -h int:value:"$volume" "Volume: ${volume}%"
