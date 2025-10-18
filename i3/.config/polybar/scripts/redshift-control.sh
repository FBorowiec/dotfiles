#!/bin/bash

# Redshift control script for polybar
# This script manages redshift state and temperature adjustments

STATE_FILE="/tmp/redshift_state"
TEMP_FILE="/tmp/redshift_temp"
CONFIG_FILE="$HOME/.config/redshift.conf"

# Initialize state file if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    if pgrep -x "redshift" > /dev/null || pgrep -x "redshift-gtk" > /dev/null; then
        echo "on" > "$STATE_FILE"
    else
        echo "off" > "$STATE_FILE"
    fi
fi

# Initialize temperature file if it doesn't exist
if [ ! -f "$TEMP_FILE" ]; then
    echo "3400" > "$TEMP_FILE"
fi

get_state() {
    cat "$STATE_FILE"
}

get_temp() {
    cat "$TEMP_FILE"
}

toggle() {
    current_state=$(get_state)

    if [ "$current_state" = "on" ]; then
        # Turn off redshift
        pkill -x redshift
        pkill -x redshift-gtk
        echo "off" > "$STATE_FILE"
        notify-send "Blue Light Filter" "Disabled" -t 2000 -i display-brightness
    else
        # Turn on redshift with current temperature
        temp=$(get_temp)
        redshift -x  # Reset to normal first
        redshift -O ${temp}K -P &
        echo "on" > "$STATE_FILE"
        notify-send "Blue Light Filter" "Enabled at ${temp}K" -t 2000 -i display-brightness
    fi
}

increase_temp() {
    current_temp=$(get_temp)
    new_temp=$((current_temp + 200))

    # Cap at 6500K (daylight)
    if [ $new_temp -gt 6500 ]; then
        new_temp=6500
    fi

    echo "$new_temp" > "$TEMP_FILE"

    # Apply if redshift is on
    if [ "$(get_state)" = "on" ]; then
        redshift -x
        redshift -O ${new_temp}K -P &
        notify-send "Blue Light Filter" "Temperature: ${new_temp}K" -t 1500 -i display-brightness
    fi
}

decrease_temp() {
    current_temp=$(get_temp)
    new_temp=$((current_temp - 200))

    # Cap at 2000K (very warm)
    if [ $new_temp -lt 2000 ]; then
        new_temp=2000
    fi

    echo "$new_temp" > "$TEMP_FILE"

    # Apply if redshift is on
    if [ "$(get_state)" = "on" ]; then
        redshift -x
        redshift -O ${new_temp}K -P &
        notify-send "Blue Light Filter" "Temperature: ${new_temp}K" -t 1500 -i display-brightness
    fi
}

status() {
    state=$(get_state)
    temp=$(get_temp)

    if [ "$state" = "on" ]; then
        echo " ${temp}K"
    else
        echo " OFF"
    fi
}

case "$1" in
    toggle)
        toggle
        ;;
    up)
        increase_temp
        ;;
    down)
        decrease_temp
        ;;
    status)
        status
        ;;
    *)
        status
        ;;
esac
