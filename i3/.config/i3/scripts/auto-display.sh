#!/bin/bash

LOCK_FILE="/tmp/auto-display.lock"
STATE_FILE="/tmp/auto-display.state"

if [ -f "$LOCK_FILE" ]; then
	exit 0
fi

echo $$ >"$LOCK_FILE"
trap "rm -f '$LOCK_FILE'" EXIT

handle_display_change() {
	XRANDR_OUTPUT=$(xrandr 2>/dev/null)
	if [ $? -ne 0 ]; then
		notify-send "xrandr failed to execute"
		return
	fi

	restart_polybar() {
		notify-send "Restarting polybar" -t 1000
		pkill polybar
		sleep 2
		DISPLAY=${DISPLAY:-:1} XAUTHORITY=${XAUTHORITY} ~/.config/polybar/launch.sh &
	}

	switch_to_laptop_only() {
		notify-send "Switching to laptop-only mode" -t 1000
		echo "$XRANDR_OUTPUT" | grep " connected\| disconnected" | cut -d' ' -f1 | while read -r display; do
			if [ "$display" != "eDP-1" ] && [ "$display" != "LVDS-1" ] && [ "$display" != "" ]; then
				notify-send "Turning off display: $display" -t 1000
				xrandr --output "$display" --off 2>/dev/null
			fi
		done

		# Set laptop display as primary - try eDP-1 first, then LVDS-1
		if echo "$XRANDR_OUTPUT" | grep -q "eDP-1 connected"; then
			xrandr --output eDP-1 --primary --auto 2>/dev/null
			notify-send "Set eDP-1 as primary" -t 1000
		elif echo "$XRANDR_OUTPUT" | grep -q "LVDS-1 connected"; then
			xrandr --output LVDS-1 --primary --auto 2>/dev/null
			notify-send "Set LVDS-1 as primary" -t 1000
		fi

		restart_polybar
		notify-send "Switched to laptop-only mode" -t 1500
	}

	switch_to_external_only() {
		local external="$1"
		notify-send "Switching to external display only: $external" -t 1500

		# Turn on external display
		xrandr --output "$external" --primary --auto 2>/dev/null
		if [ $? -eq 0 ]; then
			notify-send "Successfully enabled display: $external" -t 1000
			# Turn off laptop display
			xrandr --output eDP-1 --off 2>/dev/null || xrandr --output LVDS-1 --off 2>/dev/null

			restart_polybar
			notify-send "Using external display only: $external" -t 1500
		else
			notify-send "Failed to enable $external" -t 1500
		fi
	}

	# Count active external displays - look for displays that are connected AND have a resolution
	external_connected=$(echo "$XRANDR_OUTPUT" | grep " connected" | grep -v "eDP-1\|LVDS-1" | wc -l)
	external_active=$(echo "$XRANDR_OUTPUT" | grep " connected" | grep -v "eDP-1\|LVDS-1" | grep -c "[0-9]\+x[0-9]\+")

	prev_state=""
	if [ -f "$STATE_FILE" ]; then
		prev_state=$(cat "$STATE_FILE")
	fi
	current_state="connected_${external_connected}_active_${external_active}"

	# Only make changes if state has changed
	if [ "$current_state" != "$prev_state" ]; then
		echo "$current_state" >"$STATE_FILE"

		if [ "$external_connected" -eq 0 ]; then
			# No external displays connected
			switch_to_laptop_only
		elif [ "$external_connected" -eq 1 ]; then
			# One external display connected
			external=$(echo "$XRANDR_OUTPUT" | grep " connected" | grep -v "eDP-1\|LVDS-1" | head -1 | cut -d' ' -f1)
			if [ "$external" != "" ]; then
				switch_to_external_only "$external"
			fi
		elif [ "$external_connected" -gt 1 ]; then
			# Multiple external displays - use the first one for now
			notify-send "Multiple external displays detected, using the first one" -t 1000
			external=$(echo "$XRANDR_OUTPUT" | grep " connected" | grep -v "eDP-1\|LVDS-1" | head -1 | cut -d' ' -f1)
			if [ "$external" != "" ]; then
				switch_to_external_only "$external"
			fi
		fi
	fi
}

handle_display_change

# Monitor for display changes using X11 events
while true; do
	xev -root -event randr | while read -r line; do
		if echo "$line" | grep -q "RRScreenChangeNotify"; then
			handle_display_change
		fi
	done
done
