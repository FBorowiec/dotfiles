#!/bin/bash

BATTERY="BAT0"
LOW_THRESHOLD=10
CRITICAL_THRESHOLD=5
STATE_FILE="/tmp/battery-notification-state"
BATTERY_LEVEL=$(cat /sys/class/power_supply/"$BATTERY"/capacity 2>/dev/null)
BATTERY_STATUS=$(cat /sys/class/power_supply/"$BATTERY"/status 2>/dev/null)

# Exit if battery info is not available
if [ "$BATTERY_LEVEL" = "" ] || [ "$BATTERY_STATUS" = "" ]; then
	exit 0
fi

# Check if we're discharging (not charging or full)
if [ "$BATTERY_STATUS" = "Discharging" ]; then
	# Critical battery warning (5% or below)
	if [ "$BATTERY_LEVEL" -le "$CRITICAL_THRESHOLD" ]; then
		if [ ! -f "$STATE_FILE" ] || [ "$(cat "$STATE_FILE")" != "critical" ]; then
			notify-send -u critical "Battery Critical!" "Battery level is at ${BATTERY_LEVEL}%\nPlease plug in your charger immediately!" -i battery-caution
			echo "critical" >"$STATE_FILE"
		fi
	# Low battery warning (10% or below)
	elif [ "$BATTERY_LEVEL" -le "$LOW_THRESHOLD" ]; then
		if [ ! -f "$STATE_FILE" ] || [ "$(cat "$STATE_FILE")" != "low" ]; then
			notify-send -u normal "Battery Low" "Battery level is at ${BATTERY_LEVEL}%\nConsider plugging in your charger." -i battery-low
			echo "low" >"$STATE_FILE"
		fi
	else
		# Reset state file when battery is above low threshold
		if [ -f "$STATE_FILE" ]; then
			rm "$STATE_FILE"
		fi
	fi
else
	# Reset state file when charging or full
	if [ -f "$STATE_FILE" ]; then
		rm "$STATE_FILE"
	fi
fi
