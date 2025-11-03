#!/bin/bash

# VPN Menu - Choose between NordVPN and Tailscale
# Uses rofi to show selection menu

# Check if on home network
current_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
on_home_network=false
if [[ "$current_ssid" == 5stars3stars* ]]; then
	on_home_network=true
fi

# Get current VPN status
nordvpn_status=$(nordvpn status 2>/dev/null | grep "Status:" | awk '{print $2}')
tailscale_status=$(tailscale status --json 2>/dev/null | jq -r 'if .ExitNodeStatus.ID then "Connected" else "Disconnected" end' 2>/dev/null || echo "Disconnected")

# Build menu options
options=""

if [ "$nordvpn_status" = "Connected" ]; then
	options+="  Disconnect NordVPN\n"
else
	options+="  Connect NordVPN\n"
fi

# Only show tailscale exit node options if not on home network
if [ "$on_home_network" = false ]; then
	if [ "$tailscale_status" = "Connected" ]; then
		options+="  Disconnect Tailscale Exit Node\n"
	else
		options+="  Connect Tailscale Exit Node\n"
	fi
else
	# If somehow connected to exit node while at home, still allow disconnect
	if [ "$tailscale_status" = "Connected" ]; then
		options+="  Disconnect Tailscale Exit Node\n"
	fi
fi

# Show menu
choice=$(echo -e "$options" | rofi -dmenu -i -p "VPN" -theme ~/.config/rofi/tokyo-night.rasi)

# Handle selection
case "$choice" in
*"Connect NordVPN")
	# Disconnect Tailscale exit node first if connected
	if [ "$tailscale_status" = "Connected" ]; then
		sudo tailscale up --reset --accept-dns=false --accept-routes
		sleep 1
	fi
	nordvpn connect
	notify-send "VPN" "Connecting to NordVPN..." -t 2000
	;;
*"Disconnect NordVPN")
	nordvpn disconnect
	notify-send "VPN" "Disconnecting NordVPN..." -t 2000
	;;
*"Connect Tailscale Exit Node")
	# Check if on home network
	if [ "$on_home_network" = true ]; then
		notify-send "VPN" "Already on home network - exit node not needed" -t 3000
		exit 0
	fi
	# Disconnect NordVPN first if connected
	if [ "$nordvpn_status" = "Connected" ]; then
		nordvpn disconnect
		sleep 1
	fi
	sudo tailscale up --reset --accept-dns=false --accept-routes
	notify-send "VPN" "Connecting to Tailscale exit node..." -t 2000
	;;
*"Disconnect Tailscale Exit Node")
	sudo tailscale up --reset --accept-dns=false --accept-routes
	notify-send "VPN" "Removed exit node (tailscale mesh still active)" -t 2000
	;;
esac
