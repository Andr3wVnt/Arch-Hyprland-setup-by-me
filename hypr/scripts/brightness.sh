#!/bin/bash

# Define the step size
STEP="5%"

# Adjust brightness based on argument
case "$1" in
up)
    brightnessctl set "$STEP+" -q
    ;;
down)
    brightnessctl set "$STEP-" -q
    ;;
esac

# Get the current percentage reliably
# We grab the string ending in "%" regardless of which column it is
PERC=$(brightnessctl -m | grep -o '[0-9]\+%' | head -n1 | tr -d '%')

# Choose an icon based on level (Using Moon phases for better compatibility)
if [ "$PERC" -lt 30 ]; then
    ICON="🌑"
elif [ "$PERC" -lt 70 ]; then
    ICON="🌓"
else ICON="🌕"; fi

# Send the notification
notify-send -h string:x-dunst-stack-tag:brightness \
    -h int:value:"$PERC" \
    -u low \
    -t 2000 \
    "$ICON Brightness" "${PERC}%"
