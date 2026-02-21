#!/usr/bin/env bash

# Get the class of the currently active window
ACTIVE=$(hyprctl activewindow -j | grep '"class":' | awk -F '"' '{print $4}')

if [[ "$ACTIVE" == "org.gnome.Software" ]]; then
    # If it's the store, kill the entire process tree
    killall gnome-software
else
    # Otherwise, just close the window normally
    hyprctl dispatch killactive
fi
