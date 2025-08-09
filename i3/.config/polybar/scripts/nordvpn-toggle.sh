#!/bin/bash

# NordVPN toggle script
# Connects if disconnected, disconnects if connected

# Check if nordvpn command exists
if ! command -v nordvpn &>/dev/null; then
	notify-send "NordVPN" "NordVPN command not found" -t 3000
	exit 1
fi

# Get current status
status=$(nordvpn status 2>/dev/null | grep "Status:" | awk '{print $2}')

if [ "$status" = "Connected" ]; then
	# Currently connected, so disconnect
	nordvpn disconnect
	notify-send "NordVPN" "Disconnecting..." -t 2000
else
	# Currently disconnected, so connect
	nordvpn connect
	notify-send "NordVPN" "Connecting..." -t 2000
fi
