#!/usr/bin/env bash

# 1. Wait for the "default" junk to load (Mako, generic Dunst, etc.)
sleep 1

# 2. Kill EVERYTHING. -9 ensures they die instantly.
killall -9 mako
killall -9 dunst

# 3. Force-start Dunst pointing explicitly to your Hacker Config
# The '&' runs it in the background so it doesn't freeze the script.
dunst -config ~/.config/dunst/dunstrc &
