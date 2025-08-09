#!/bin/bash

# Bluetooth management menu for i3
# Toggle bluetooth, connect/disconnect devices

# Check if bluetooth is enabled
bt_status=$(bluetoothctl show | grep "Powered: yes")

if [ "$bt_status" != "" ]; then
	bt_icon=" "
	bt_text="ON"
else
	bt_icon="󰂲 "
	bt_text="OFF"
fi

# Get connected devices
connected_devices=$(bluetoothctl devices Connected 2>/dev/null | cut -d' ' -f3-)
paired_devices=$(bluetoothctl devices Paired 2>/dev/null | cut -d' ' -f2-)

# Build menu options
options="$bt_icon Toggle Bluetooth ($bt_text)"

if [ "$bt_status" != "" ]; then
	options="$options\n📱 Scan for devices"

	# Add connected devices with disconnect option
	while IFS= read -r device; do
		if [ "$device" != "" ]; then
			options="$options\n🔗 Disconnect: $device"
		fi
	done <<<"$connected_devices"

	# Add paired but not connected devices
	for mac in "${paired_devices[@]}"; do
		device_name=$(bluetoothctl info "$mac" 2>/dev/null | grep "Name:" | cut -d' ' -f2-)
		connected_check=$(echo "$connected_devices" | grep -F "$device_name")

		if [ "$device_name" != "" ] && [ "$connected_check" = "" ]; then
			options="$options\n🔌 Connect: $device_name"
		fi
	done
fi

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Bluetooth" -theme ~/.config/rofi/tokyo-night.rasi)

case $chosen in
"$bt_icon Toggle Bluetooth"*)
	if [ "$bt_status" != "" ]; then
		bluetoothctl power off
		notify-send "Bluetooth" "Disabled" -t 2000
	else
		bluetoothctl power on
		notify-send "Bluetooth" "Enabled" -t 2000
	fi
	;;
"📱 Scan for devices")
	bluetoothctl scan on &
	sleep 10
	bluetoothctl scan off
	notify-send "Bluetooth" "Scan completed" -t 2000
	;;
"🔗 Disconnect:"*)
	device_name=$(echo "$chosen" | cut -d':' -f2- | sed 's/^ *//')
	device_mac=$(bluetoothctl devices | grep -F "$device_name" | cut -d' ' -f2)
	if [ "$device_mac" != "" ]; then
		bluetoothctl disconnect "$device_mac"
		notify-send "Bluetooth" "Disconnected from $device_name" -t 2000
	fi
	;;
"🔌 Connect:"*)
	device_name=$(echo "$chosen" | cut -d':' -f2- | sed 's/^ *//')
	device_mac=$(bluetoothctl devices | grep -F "$device_name" | cut -d' ' -f2)
	if [ "$device_mac" != "" ]; then
		bluetoothctl connect "$device_mac"
		notify-send "Bluetooth" "Connecting to $device_name..." -t 2000
	fi
	;;
esac
