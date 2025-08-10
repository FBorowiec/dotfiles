#!/bin/bash

CONFIG_FILE="$HOME/.config/i3/statusbar-choice"

# Create config file if it doesn't exist
if [ ! -f "$CONFIG_FILE" ]; then
	echo "polybar" >"$CONFIG_FILE"
fi

# Get current choice
CURRENT=$(cat "$CONFIG_FILE")

case "${1:-start}" in
"polybar")
	echo "polybar" >"$CONFIG_FILE"
	echo "Switched to polybar"
	;;
"i3blocks")
	echo "i3blocks" >"$CONFIG_FILE"
	echo "Switched to i3blocks"
	;;
"toggle")
	if [ "$CURRENT" = "polybar" ]; then
		echo "i3blocks" >"$CONFIG_FILE"
		echo "Switched to i3blocks"
	else
		echo "polybar" >"$CONFIG_FILE"
		echo "Switched to polybar"
	fi
	;;
"start")
	# No message when starting - just use current selection
	;;
"status")
	echo "Current status bar: $CURRENT"
	exit 0
	;;
*)
	echo "Usage: $0 {polybar|i3blocks|toggle|start|status}"
	echo "Current: $CURRENT"
	exit 1
	;;
esac

# Kill existing bars
pkill polybar 2>/dev/null
pkill i3blocks 2>/dev/null

# Start the selected status bar
NEW_CHOICE=$(cat "$CONFIG_FILE")
case "$NEW_CHOICE" in
"polybar")
	# Hide i3 bar and start polybar
	if pgrep -x i3 >/dev/null; then
		i3-msg "bar hidden_state hide bar-main" 2>/dev/null
	fi
	~/.config/polybar/launch.sh &
	;;
"i3blocks")
	# Show i3 bar with i3blocks
	if pgrep -x i3 >/dev/null; then
		i3-msg "bar hidden_state show bar-main" 2>/dev/null
	fi
	;;
esac

echo "Status bar switched to: $NEW_CHOICE"
