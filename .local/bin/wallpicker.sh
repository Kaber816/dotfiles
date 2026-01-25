#!/bin/bash

WALLDIR="$HOME/Pictures/Wallpapers"

WALL=$(ls "$WALLDIR" | wofi --dmenu -i -p "Wallpaper")

[ -z "$WALL" ] && exit 0

hyprctl hyprpaper wallpaper "DP-5, $WALLDIR/$WALL"
hyprctl hyprpaper wallpaper "DP-6, $WALLDIR/$WALL"
hyprctl hyprpaper wallpaper "eDP-1, $WALLDIR/$WALL"

