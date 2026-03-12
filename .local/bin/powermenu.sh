#!/bin/bash

options=" Shutdown\n Restart\n󰤄 Sleep\n Lock\n"
selection=$(echo -e $options | wofi --dmenu -j -W 10% -H 20% --confg ~/.config/wofi/powermenu.conf)

case $selection in

    
    " Shutdown")
        systemctl poweroff
    ;;

    " Restart")
        reboot
    ;;

    "󰤄 Sleep")
        systemctl suspend --now
    ;;

    " Lock")
        hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit
    ;;
esac
