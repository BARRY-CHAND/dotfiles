#!/bin/bash

monitor-sensor | while read -r line; do
    case "$line" in
        *"Accelerometer orientation changed: normal"*)
            hyprctl keyword monitor "eDP-1,preferred,auto,1,transform,0"
            ;;

        *"Accelerometer orientation changed: left-up"*)
            hyprctl keyword monitor "eDP-1,preferred,auto,1,transform,1"
            ;;

        *"Accelerometer orientation changed: bottom-up"*)
            hyprctl keyword monitor "eDP-1,preferred,auto,1,transform,2"
            ;;

        *"Accelerometer orientation changed: right-up"*)
            hyprctl keyword monitor "eDP-1,preferred,auto,1,transform,3"
            ;;
    esac
done
