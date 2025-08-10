#!/bin/bash

# Auto display management script
# Automatically switches to laptop-only when external displays are disconnected

# Function to switch to laptop only
switch_to_laptop_only() {
	# Turn off all external displays (both connected and disconnected)
	xrandr | grep -E " connected| disconnected" | cut -d' ' -f1 | while read -r display; do
		if [ "$display" != "eDP-1" ] && [ "$display" != "LVDS-1" ]; then
			xrandr --output "$display" --off
		fi
	done

	# Set laptop display as primary
	xrandr --output eDP-1 --primary --auto 2>/dev/null || xrandr --output LVDS-1 --primary --auto

	# Wait a moment for xrandr changes to settle
	sleep 1

	# Restart polybar to adjust to new display configuration
	pkill polybar
	~/.config/polybar/launch.sh &

	notify-send "Display" "Switched to laptop-only mode" -t 2000
}

# Count active external displays (those with resolution)
external_active=$(xrandr | grep " connected" | grep -v "eDP-1\|LVDS-1" | grep -c "[0-9]\+x[0-9]\+")

# If no active external displays, switch to laptop only
if [ "$external_active" -eq 0 ]; then
	switch_to_laptop_only
elif [ "$external_active" -eq 1 ]; then
	# External display connected, switch to external only
	external=$(xrandr | grep " connected" | grep -v "eDP-1\|LVDS-1" | head -1 | cut -d' ' -f1)
	if [ "$external" != "" ]; then
		xrandr --output "$external" --primary --auto
		xrandr --output eDP-1 --off 2>/dev/null || xrandr --output LVDS-1 --off

		# Wait a moment for xrandr changes to settle
		sleep 1

		# Restart polybar to adjust to new display configuration
		pkill polybar
		~/.config/polybar/launch.sh &

		notify-send "Display" "Using external display only: $external" -t 2000
	fi
fi
