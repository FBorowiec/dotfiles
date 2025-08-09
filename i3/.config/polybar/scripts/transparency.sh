#!/bin/bash

# Polybar transparency toggle script
# Shows ghost icon based on current transparency state

PICOM_CONFIG="$HOME/.config/picom/picom.conf"

# Check if any apps currently have 80% opacity
if grep -q "80:class_g" "$PICOM_CONFIG"; then
	# Currently transparent (80%) - show solid ghost
	echo "󱙝 "
else
	# Currently opaque (100%) - show transparent ghost
	echo "󰊠 "
fi
