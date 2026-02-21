#!/bin/bash

AC_PROFILE="performance"
BAT_PROFILE="balanced"

# Store the initial state (fake value to force first run)
LAST_STATE="-1"

apply_profile() {
    # Read current state (1 = AC, 0 = Bat)
    CURRENT_STATE=$(cat /sys/class/power_supply/AC*/online)

    # Only run if the state has ACTUALLY changed
    if [ "$CURRENT_STATE" != "$LAST_STATE" ]; then
        if [ "$CURRENT_STATE" -eq 1 ]; then
            powerprofilesctl set $AC_PROFILE
            notify-send -u low -t 2000 "Power Profile" "Performance (AC)"
        else
            powerprofilesctl set $BAT_PROFILE
            notify-send -u low -t 2000 "Power Profile" "Balanced (Battery)"
        fi
        # Update the memory
        LAST_STATE="$CURRENT_STATE"
    fi
}

# Run immediately to set initial state
apply_profile

# Listen for events but filter duplicates logic above
udevadm monitor --subsystem-match=power_supply | while read -r line; do
    # Add a tiny delay to let all simultaneous events fire, then check once
    sleep 0.1
    apply_profile
done
