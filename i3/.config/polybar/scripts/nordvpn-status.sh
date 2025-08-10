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
	country=$(nordvpn status 2>/dev/null | grep "Country:" | cut -d' ' -f2-)
	echo "  $country"
	;;
"Disconnected" | "")
	echo "  " # Disconnected VPN icon
	;;
*)
	echo "󰤫  " # Unknown/connecting status
	;;
esac
