#!/bin/bash

CONFIG_FILE="$HOME/.config/alacritty/alacritty.toml"
OPACITY_VALUE="0.6"

if [ -f "$CONFIG_FILE" ]; then
	# Check if the opacity line is present
	if grep -q "opacity =" "$CONFIG_FILE"; then
		# Toggle opacity value
		if grep -q "opacity = $OPACITY_VALUE" "$CONFIG_FILE"; then
			sed -i "s/opacity = $OPACITY_VALUE/opacity = 1.0/" "$CONFIG_FILE"
		else
			sed -i "s/opacity = [0-9.]*$/opacity = $OPACITY_VALUE/" "$CONFIG_FILE"
		fi
	fi

else
	notify-send "Alacritty configuration file not found: $CONFIG_FILE"
fi
