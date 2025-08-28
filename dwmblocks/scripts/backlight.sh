#!/bin/bash

# Prefix icon
printf "  "

# Get current and maximum brightness values
curr=$(brightnessctl get)
max=$(brightnessctl max)

# Calculate percentage using integer arithmetic
percent=$((curr * 100 / max))

# Print percentage followed by “%”
printf "%d%%\n" "$percent"
