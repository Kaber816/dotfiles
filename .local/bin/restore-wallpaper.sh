#!/bin/bash

WALL=$(cat "$HOME/.cache/current_wallpaper" 2>/dev/null)

[ -z "$WALL" ] && exit 0

hyprctl hyprpaper wallpaper "DP-5, $WALL"
hyprctl hyprpaper wallpaper "DP-6, $WALL"
hyprctl hyprpaper wallpaper "eDP-1, $WALL"
