#!/bin/bash

# Get the class of the currently focused window
ACTIVE_CLASS=$(hyprctl activewindow -j | jq -r ".class")

if [ "$ACTIVE_CLASS" == "steam" ]; then
    # If it's Steam, kill the process completely
    pkill -9 steam &
    pkill -9 steamwebhelper &
    notify-send "Steam Killed" "Completely exited."
else
    # For any other app, just close the window normally
    hyprctl dispatch killactive
fi
