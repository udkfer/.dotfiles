#!/bin/bash

while true; do
    if [[ -f /sys/class/power_supply/BAT0/capacity && -f /sys/class/power_supply/AC/online ]]; then
        battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
        battery_status=$(cat /sys/class/power_supply/AC/online)
        current_date=$(date '+%Y/%m/%d %B/%A %R')

        case "$battery_status" in
            "1")
                battery_icon="󰂄"
                ;;
            *)
                battery_icon="󰁹"
                ;;
        esac

        echo "$battery_capacity$battery_icon $current_date"
    else
        echo "Battery information not available"
    fi

    sleep 60
done
