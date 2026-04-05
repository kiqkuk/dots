#!/bin/sh

FILE="$HOME/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%m-%s').png"
mkdir -p "$(dirname "$FILE")"

slurp | grim -g - "$FILE"

if [ -f "$FILE" ]; then
    wl-copy < "$FILE"
    echo "Screenshot saved to $FILE and copied to clipboard."
fi
