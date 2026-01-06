#!/bin/bash

case $1 in
    "area")
        # Select area, then open in Swappy for editing/saving
        grim -g "$(slurp)" - | swappy -f -
        ;;
    "full")
        # Capture full screen immediately to clipboard and save file
        FILENAME="$HOME/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S.png')"
        grim "$FILENAME"
        wl-copy < "$FILENAME"
        notify-send "Screenshot" "Full screen saved to $FILENAME"
        ;;
esac
