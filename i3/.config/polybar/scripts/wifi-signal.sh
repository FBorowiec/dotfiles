#!/bin/bash

# Get wireless interface name
interface=$(nmcli -t -f device,type device | grep wifi | cut -d: -f1 | head -1)

if [ "$interface" = "" ]; then
	echo ""
	exit 0
fi

# Check if connected
if ! nmcli -t -f active,ssid dev wifi | grep -q '^yes'; then
	echo ""
	exit 0
fi

# Get signal info from iwconfig (single call)
iwconfig_output=$(iwconfig "$interface" 2>/dev/null)

if [ "$iwconfig_output" = "" ]; then
	echo ""
	exit 0
fi

# Parse all values in one go
link_quality=$(echo "$iwconfig_output" | awk '/Link Quality/ {match($0, /Link Quality=([0-9]+\/[0-9]+)/, arr); print arr[1]}')
signal_level=$(echo "$iwconfig_output" | awk '/Signal level/ {match($0, /Signal level=(-[0-9]+ dBm)/, arr); print arr[1]}')
bit_rate=$(echo "$iwconfig_output" | awk '/Bit Rate/ {match($0, /Bit Rate=([0-9.]+ [MG]b\/s)/, arr); print arr[1]}')

# Format output
output=""
if [ "$link_quality" != "" ]; then
	output+="quality: $link_quality |"
fi
if [ "$signal_level" != "" ]; then
	[ "$output" != "" ] && output+=" "
	output+="lvl: $signal_level |"
fi
if [ "$bit_rate" != "" ]; then
	[ "$output" != "" ] && output+=" "
	output+="bit rate:$bit_rate"
fi

echo "$output"
