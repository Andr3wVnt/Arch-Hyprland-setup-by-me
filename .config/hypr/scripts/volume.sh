#!/usr/bin/env bash

# Define the step size (e.g., 5% or 2% for more precision)
STEP="5%"

# Function to send the notification
show_notification() {
    # Get current volume (e.g., 0.55) and convert to integer (55)
    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')

    # Get mute status
    MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep "MUTED")

    if [ -n "$MUTED" ]; then
        ICON="🔴"
        TEXT="Muted"
    else
        # Choose icon based on volume level
        if [ "$VOL" -lt 30 ]; then
            ICON="🔈"
        elif [ "$VOL" -lt 70 ]; then
            ICON="🔉"
        else ICON="🔊"; fi
        TEXT="${VOL}%"
    fi

    # Send notification
    # -h int:value:$VOL -> Draws the progress bar
    # -h string:x-dunst-stack-tag:audio -> Overwrites the previous notification
    notify-send -h string:x-dunst-stack-tag:audio \
        -h int:value:"$VOL" \
        -u low \
        -t 2000 \
        "$ICON Volume" "$TEXT"
}

# Handle Arguments
case "$1" in
up)
    # Limit to 100% (remove -l 1.0 if you want to go higher)
    wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ $STEP+
    ;;
down)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ $STEP-
    ;;
mute)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    ;;
esac

show_notification
