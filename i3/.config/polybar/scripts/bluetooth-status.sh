#!/bin/bash

if ! systemctl is-active --quiet bluetooth; then
	echo "󰂲 " # Bluetooth service off
	exit 0
fi

# Check bluetooth power status
power_status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$power_status" = "yes" ]; then
	# Check if any device is connected
	connected_devices=$(bluetoothctl devices | while read -r device; do
		mac=$(echo "$device" | awk '{print $2}')
		if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
			echo "connected"
			break
		fi
	done)

	if [ "$connected_devices" = "connected" ]; then
		echo " " # Connected
	else
		echo "󰂲 " # On but not connected
	fi
else
	echo "󰂲 " # Powered off
fi
