#!/bin/bash

# Auto display management script (optimized for low CPU usage)
# Automatically switches to laptop-only when external displays are disconnected

LOCK_FILE="/tmp/auto-display.lock"
STATE_FILE="/tmp/auto-display.state"

# Exit if another instance is running
if [ -f "$LOCK_FILE" ]; then
	exit 0
fi

# Create lock file
echo $$ >"$LOCK_FILE"
trap "rm -f '$LOCK_FILE'" EXIT

# Cache xrandr output to avoid multiple calls
XRANDR_OUTPUT=$(xrandr 2>/dev/null)

# Function to restart polybar only if needed
restart_polybar_if_needed() {
	if pgrep -x polybar >/dev/null; then
		pkill polybar
		sleep 0.5
		~/.config/polybar/launch.sh &
	fi
}

# Function to switch to laptop only
switch_to_laptop_only() {
	# Get all non-laptop displays from cached output
	echo "$XRANDR_OUTPUT" | grep -E " connected| disconnected" | cut -d' ' -f1 | while read -r display; do
		if [ "$display" != "eDP-1" ] && [ "$display" != "LVDS-1" ]; then
			xrandr --output "$display" --off 2>/dev/null
		fi
	done

	# Set laptop display as primary
	xrandr --output eDP-1 --primary --auto 2>/dev/null || xrandr --output LVDS-1 --primary --auto 2>/dev/null

	restart_polybar_if_needed
	notify-send "Display" "Switched to laptop-only mode" -t 2000
}

# Count active external displays using cached output
external_active=$(echo "$XRANDR_OUTPUT" | grep " connected" | grep -v "eDP-1\|LVDS-1" | grep -c "[0-9]\+x[0-9]\+")

# Read previous state
prev_state=""
if [ -f "$STATE_FILE" ]; then
	prev_state=$(cat "$STATE_FILE")
fi

current_state="external_$external_active"

# Only make changes if state has changed
if [ "$current_state" != "$prev_state" ]; then
	echo "$current_state" >"$STATE_FILE"

	if [ "$external_active" -eq 0 ]; then
		switch_to_laptop_only
	elif [ "$external_active" -eq 1 ]; then
		# External display connected, switch to external only
		external=$(echo "$XRANDR_OUTPUT" | grep " connected" | grep -v "eDP-1\|LVDS-1" | head -1 | cut -d' ' -f1)
		if [ "$external" != "" ]; then
			xrandr --output "$external" --primary --auto 2>/dev/null
			xrandr --output eDP-1 --off 2>/dev/null || xrandr --output LVDS-1 --off 2>/dev/null

			restart_polybar_if_needed
			notify-send "Display" "Using external display only: $external" -t 2000
		fi
	fi
fi
