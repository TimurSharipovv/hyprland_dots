#!/bin/sh

options="Shutdown\nReboot\nSuspend\nLock"

chosen=$(echo -e "$options" | rofi -dmenu -i -p ' ')

case "$chosen" in
    "Reboot") 
        systemctl reboot ;;
    "Shutdown") 
        systemctl poweroff ;;
    "Suspend") 
        systemctl suspend ;;
    "Lock") 
        exec hyprlock ;;
esac
