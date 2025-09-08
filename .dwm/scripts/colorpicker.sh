#!/bin/bash

# Check if xcolor is installed
if ! command -v xcolor &> /dev/null; then
    echo "xcolor not found. Please install it first."
    exit 1
fi

# Check if xclip or wl-copy is available for clipboard support
if command -v xclip &> /dev/null; then
    CLIP_CMD="xclip -selection clipboard"
elif command -v wl-copy &> /dev/null; then
    CLIP_CMD="wl-copy"
else
    echo "No clipboard tool found (xclip or wl-copy). Please install one."
    exit 1
fi

# Run xcolor and store result
COLOR=$(xcolor)

# Copy to clipboard
echo -n "$COLOR" | $CLIP_CMD

# Notify user
echo "Picked color: $COLOR (copied to clipboard)"
