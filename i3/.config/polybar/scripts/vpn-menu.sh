#!/bin/bash

# VPN Menu - Choose between NordVPN and WireGuard
# Uses rofi to show selection menu

# Check if we're on home network
home_network_ip="192.168.0.114"
on_home_network=$(ip route get "$home_network_ip" 2>/dev/null | grep -q "via" || ping -c 1 -W 1 "$home_network_ip" &>/dev/null && echo "yes" || echo "no")

# Get current VPN status
nordvpn_status=$(nordvpn status 2>/dev/null | grep "Status:" | awk '{print $2}')
wireguard_status=$(ip link show wg0-home 2>/dev/null && echo "Connected" || echo "Disconnected")

# Build menu options
options=""

if [ "$nordvpn_status" = "Connected" ]; then
	options+="  Disconnect NordVPN\n"
else
	options+="  Connect NordVPN\n"
fi

# Only show WireGuard option if NOT on home network
if [ "$on_home_network" = "yes" ]; then
	if [ "$wireguard_status" = "Connected" ]; then
		options+="  Disconnect WireGuard Home (Warning: At Home!)\n"
	else
		options+="⚠  WireGuard Home (Disabled - At Home)\n"
	fi
else
	if [ "$wireguard_status" = "Connected" ]; then
		options+="  Disconnect WireGuard Home\n"
	else
		options+="  Connect WireGuard Home\n"
	fi
fi

# Show menu
choice=$(echo -e "$options" | rofi -dmenu -i -p "VPN" -theme ~/.config/rofi/tokyo-night.rasi)

# Handle selection
case "$choice" in
*"Connect NordVPN")
	# Disconnect WireGuard first if connected
	if [ "$wireguard_status" = "Connected" ]; then
		sudo wg-quick down wg0-home
		sleep 1
	fi
	nordvpn connect
	notify-send "VPN" "Connecting to NordVPN..." -t 2000
	;;
*"Disconnect NordVPN")
	nordvpn disconnect
	notify-send "VPN" "Disconnecting NordVPN..." -t 2000
	;;
*"Connect WireGuard Home")
	# Only allow if NOT on home network
	if [ "$on_home_network" = "yes" ]; then
		notify-send "VPN" "Cannot connect: You're at home!" -u critical -t 3000
		exit 1
	fi
	# Disconnect NordVPN first if connected
	if [ "$nordvpn_status" = "Connected" ]; then
		nordvpn disconnect
		sleep 1
	fi
	sudo wg-quick up wg0-home
	notify-send "VPN" "Connecting to WireGuard Home..." -t 2000
	;;
*"Disconnect WireGuard Home"*)
	sudo wg-quick down wg0-home
	notify-send "VPN" "Disconnecting WireGuard Home..." -t 2000
	;;
*"Disabled - At Home"*)
	notify-send "VPN" "WireGuard only works when away from home" -t 3000
	;;
esac
