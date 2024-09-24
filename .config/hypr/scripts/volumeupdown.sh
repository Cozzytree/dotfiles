#!/bin/bash

# Path to swaync

# Get the current volume
VOLUME=$(pamixer --get-volume)

# Get the volume change status
if [ "$1" == "up" ]; then
    swaync --title "Volume" --text "Volume increased to $VOLUME%"
elif [ "$1" == "down" ]; then
    swaync --title "Volume" --text "Volume decreased to $VOLUME%"
fi
