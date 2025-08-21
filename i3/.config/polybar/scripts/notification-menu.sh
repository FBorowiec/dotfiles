#!/bin/bash

notifications=$(dunstctl history | jq -r '.data[0][] | select(.message.data != "") | "\(.appname.data): \(.summary.data)\n\(.message.data)"' 2>/dev/null || echo "No notifications")

if [ "$notifications" = "No notifications" ] || [ "$notifications" = "" ]; then
	rofi_output=$(echo -e "No recent notifications\n---\nClear History" | rofi -dmenu -p "Notifications" -theme ~/.config/rofi/tokyo-night.rasi)
else
	rofi_output=$(echo -e "$notifications\n---\nClear History\nClose All\nToggle DND" | rofi -dmenu -p "Notifications" -theme ~/.config/rofi/tokyo-night.rasi)
fi

case "$rofi_output" in
"Clear History")
	dunstctl history-clear
	notify-send "Notifications" "History cleared"
	;;
"Close All")
	dunstctl close-all
	;;
"Toggle DND")
	dunstctl toggle
	if dunstctl is-paused | grep -q "true"; then
		notify-send "Notifications" "DND enabled"
	else
		notify-send "Notifications" "DND disabled"
	fi
	;;
esac
