#!/usr/bin/env bash

# Your exact device name
DEVICE="syna7db5:01-06cb:ceb1-touchpad"
STATE_FILE="/tmp/touchpad_state"

# If state file doesn't exist, assume touchpad is ON (1) to start
if [ ! -f "$STATE_FILE" ]; then
    echo "1" >"$STATE_FILE"
fi

# Read the current state
STATE=$(cat "$STATE_FILE")

if [ "$STATE" -eq 1 ]; then
    # It was ON, so turn it OFF
    hyprctl keyword "device:$DEVICE:enabled" 0
    echo "0" >"$STATE_FILE"
    notify-send -u low -t 2000 "Touchpad" "🔴 Disabled"
else
    # It was OFF, so turn it ON
    hyprctl keyword "device:$DEVICE:enabled" 1
    echo "1" >"$STATE_FILE"
    notify-send -u low -t 2000 "Touchpad" "🟢 Enabled"
fi
