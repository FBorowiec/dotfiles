#!/bin/bash

if ! pgrep -x "dunst" >/dev/null; then
	echo "󰂚 OFF"
	exit 0
fi

notification_count=$(dunstctl count displayed 2>/dev/null || echo "0")

if dunstctl is-paused 2>/dev/null | grep -q "true"; then
	echo "󰂛 DND"
else
	if [ "$notification_count" -gt 0 ]; then
		echo "󰂚 $notification_count"
	else
		echo "󰂚 "
	fi
fi
