#!/bin/bash

nordvpn_status=$(nordvpn status 2>/dev/null | grep "Status:" | awk '{print $2}')
tailscale_exit_node=$(tailscale status --json 2>/dev/null | jq -r 'if .ExitNodeStatus.ID then "Connected" else "Disconnected" end' 2>/dev/null || echo "Disconnected")

output=""
if [ "$nordvpn_status" = "Connected" ]; then
	country=$(nordvpn status 2>/dev/null | grep "Country:" | cut -d' ' -f2-)
	output="󰖂   N:$country"
elif [ "$tailscale_exit_node" = "Connected" ]; then
	output="󰖂   T:Home"
else
	output="󰖂   " # Both disconnected
fi

echo "$output"
