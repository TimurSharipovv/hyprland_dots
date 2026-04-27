#!/bin/sh

options="Performance\nBalanced\nPowersaver"

chosen=$(echo -e "$options" | rofi -dmenu -i -p 'Profiles')

case "$chosen" in
    "Performance") 
        powerprofilesctl set performance ;;
    "Balansed") 
        powerprofilesctl set balanced ;;
    "Powersaver") 
        powerprofilesctl set power-saver ;;
esac
