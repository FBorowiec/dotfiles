#!/bin/bash

# NordVPN status script for polybar
# Shows VPN connection status with appropriate icon

# Check if nordvpn command exists
if ! command -v nordvpn &>/dev/null; then
	echo "󰤭  " # VPN unavailable
	exit 1
fi

# Get NordVPN status
status=$(nordvpn status 2>/dev/null | grep "Status:" | awk '{print $2}')

case "$status" in
"Connected")
	# Get server location for tooltip
	server=$(nordvpn status 2>/dev/null | grep "Current server:" | cut -d' ' -f3-)
	if [ "$server" != "" ]; then
		echo "   -  "
	else
		echo "   -  "
	fi
	;;
"Disconnected" | "")
	echo "   -   " # Disconnected VPN icon
	;;
*)
	echo "   - 󰤫  " # Unknown/connecting status
	;;
esac
