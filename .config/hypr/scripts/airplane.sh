#!/usr/bin/env bash

# Toggle specifically Wifi (more reliable than 'all')
rfkill toggle wifi

# Wait for kernel
sleep 0.1

# Check if Wifi is BLOCKED
if rfkill list wifi | grep -q "Soft blocked: yes"; then
    notify-send -u low -t 2000 "Wifi" "🔴 Turned OFF"
else
    notify-send -u low -t 2000 "Wifi" "🟢 Turned ON"
fi
