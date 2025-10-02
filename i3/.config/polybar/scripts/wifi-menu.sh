#!/bin/bash

# WiFi Menu - Show available networks and connect
# Uses rofi to show network selection

# Check if WiFi is enabled
wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" = "disabled" ]; then
	choice=$(echo -e "  Enable WiFi" | rofi -dmenu -i -p "WiFi Disabled" -theme ~/.config/rofi/tokyo-night.rasi)
	if [ "$choice" = "  Enable WiFi" ]; then
		nmcli radio wifi on
		notify-send "WiFi" "WiFi enabled" -t 2000
	fi
	exit 0
fi

current_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
nmcli device wifi rescan 2>/dev/null
networks=$(nmcli -t -f ssid,signal,security dev wifi list | sort -t: -k2 -rn | awk -F: '!seen[$1]++ {print $1}')
options=""
if [ "$current_ssid" != "" ]; then
	options+="  Disconnect from $current_ssid\n"
fi

options+="  Disable WiFi\n"
options+="  Network Settings\n"
options+="---\n"

while IFS= read -r ssid; do
	if [ "$ssid" != "" ]; then
		if [ "$ssid" = "$current_ssid" ]; then
			options+="  $ssid (connected)\n"
		else
			options+="  $ssid\n"
		fi
	fi
done <<<"$networks"

choice=$(echo -e "$options" | rofi -dmenu -i -p "WiFi Networks" -theme ~/.config/rofi/tokyo-night.rasi)
case "$choice" in
*"Disconnect from"*)
	nmcli device disconnect "$(nmcli -t -f device,type device | grep wifi | cut -d: -f1 | head -1)"
	notify-send "WiFi" "Disconnected from $current_ssid" -t 2000
	;;
*"Disable WiFi")
	nmcli radio wifi off
	notify-send "WiFi" "WiFi disabled" -t 2000
	;;
*"Network Settings")
	nm-connection-editor &
	;;
*"(connected)")
	# Already connected, do nothing
	;;
"---")
	# Separator, do nothing
	;;
*)
	if [ "$choice" != "" ]; then
		# Extract SSID (remove icon)
		ssid=$(echo "$choice" | sed 's/^  //')

		# Check if we have saved credentials
		if nmcli connection show | grep -q "$ssid"; then
			nmcli connection up "$ssid"
			notify-send "WiFi" "Connecting to $ssid..." -t 2000
		else
			# Prompt for password
			password=$(rofi -dmenu -password -p "Password for $ssid" -theme ~/.config/rofi/tokyo-night.rasi)
			if [ "$password" != "" ]; then
				nmcli device wifi connect "$ssid" password "$password"
				notify-send "WiFi" "Connecting to $ssid..." -t 2000
			fi
		fi
	fi
	;;
esac
