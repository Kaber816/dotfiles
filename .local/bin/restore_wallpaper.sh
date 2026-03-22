#!/bin/bash

WALL=$(cat "$HOME/.cache/current_wallpaper" 2>/dev/null)

[ -z "$WALL" ] && exit 0

# Restore wallpaper
hyprctl hyprpaper wallpaper "DP-5, $WALL"
hyprctl hyprpaper wallpaper "DP-6, $WALL"
hyprctl hyprpaper wallpaper "eDP-1, $WALL"

# Restore pywal colors
wal -i "$WALL" -q

# Refresh programs using wal colors
pkill -SIGUSR2 waybar
pkill -SIGUSR2 swaync-client
pkill -SIGUSR2 swaync

# Update firefox theme
pywalfox update
