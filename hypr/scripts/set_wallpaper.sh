#!/bin/bash

# 1. Capture the image path from Yazi
NEW_WALL="$1"

# 2. APPLY INSTANTLY (The part you already have)
# Load the new image and set it
hyprctl hyprpaper preload "$NEW_WALL"
hyprctl hyprpaper wallpaper ",$NEW_WALL"

# 3. MAKE IT PERMANENT (The missing part)
# We overwrite the config file with the new image info
# AND ensure 'splash = false' is always written at the top.

cat >~/.config/hypr/hyprpaper.conf <<EOF
splash = false
preload = $NEW_WALL
wallpaper = ,$NEW_WALL
EOF

# 4. Cleanup to save RAM
sleep 1
hyprctl hyprpaper unload unused
