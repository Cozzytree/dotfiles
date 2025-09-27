#!/bin/bash

MODES=("power-saver" "balanced" "performance")
MODE_FILE="/tmp/current_perf_mode"

# Get current mode from powerprofilesctl
current_mode=$(powerprofilesctl get)

# Handle click (if present)
if [[ -n "$1" ]]; then
    # Find index of current mode
    for i in "${!MODES[@]}"; do
        if [[ "${MODES[$i]}" == "$current_mode" ]]; then
            next_index=$(( (i + 1) % ${#MODES[@]} ))
            break
        fi
    done

    # Switch to next mode
    new_mode="${MODES[$next_index]}"
    powerprofilesctl set "$new_mode"
    current_mode="$new_mode"
fi

# Output current mode for status bar
case "$current_mode" in
    "power-saver") echo "🔋" ;;
    "balanced")    echo " " ;;
    "performance") echo "🚀" ;;
    *)             echo "❓" ;;
esac
