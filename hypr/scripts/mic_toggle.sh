#!/usr/bin/env bash

# Toggle the default microphone
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# Get the new status
STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

# Check if the output contains "[MUTED]"
if [[ "$STATUS" == *"[MUTED]"* ]]; then
    notify-send -u low -t 2000 "Microphone" "🔴 Muted"
else
    # Extract volume percentage for the notification
    VOL=$(echo "$STATUS" | awk '{print $2 * 100 "%"}')
    notify-send -u low -t 2000 "Microphone" "🟢 ON ($VOL)"
fi
