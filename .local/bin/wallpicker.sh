#!/bin/bash

WALLDIR="$HOME/Pictures/Wallpapers"

WALL=$(ls "$WALLDIR" | wofi --dmenu -i -p "Wallpaper")

[ -z "$WALL" ] && exit 0

hyprctl hyprpaper wallpaper "DP-3, $WALLDIR/$WALL"
hyprctl hyprpaper wallpaper "DP-2, $WALLDIR/$WALL"

