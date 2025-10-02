#!/bin/bash

# VPN status script for polybar
# Shows NordVPN and WireGuard status

# Get NordVPN status
nordvpn_status=$(nordvpn status 2>/dev/null | grep "Status:" | awk '{print $2}')

# Get WireGuard status (check if interface exists)
wireguard_status=$(ip link show wg0-home 2>/dev/null && echo "Connected" || echo "Disconnected")

# Build output
output=""

if [ "$nordvpn_status" = "Connected" ]; then
	country=$(nordvpn status 2>/dev/null | grep "Country:" | cut -d' ' -f2-)
	output="   : $country"
elif [ "$wireguard_status" = "Connected" ]; then
	output="   : Home"
else
	output="󰖂 " # Both disconnected
fi

echo "$output"
