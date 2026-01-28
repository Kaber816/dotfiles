#!/bin/bash

HOSTNAME=$(hostnamectl --static)

case "$HOSTNAME" in
  laptop)
    hyprmon --profile laptop
    ;;
  desktop)
    hyprmon --profile desktop
    ;;
  *)
    echo "Hostname not recognized, not applying hyprmon profile"
    ;;
esac

