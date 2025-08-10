#!/bin/bash

# Toggle transparency script for picom
# Switches between 80% and 100% opacity for transparent apps

PICOM_CONFIG="$HOME/.config/picom/picom.conf"

# Check current opacity state by looking for 80% opacity rules
if grep -q "80:class_g = 'Alacritty'" "$PICOM_CONFIG"; then
	# Currently at 80%, switch to 100%
	sed -i 's/80:class_g = '\''Alacritty'\''/100:class_g = '\''Alacritty'\''/g' "$PICOM_CONFIG"
	sed -i 's/80:class_g = '\''kitty'\''/100:class_g = '\''kitty'\''/g' "$PICOM_CONFIG"
	sed -i 's/80:class_g = '\''URxvt'\''/100:class_g = '\''URxvt'\''/g' "$PICOM_CONFIG"
	sed -i 's/80:class_g = '\''Polybar'\''/100:class_g = '\''Polybar'\''/g' "$PICOM_CONFIG"
	sed -i 's/80:class_g = '\''Rofi'\''/100:class_g = '\''Rofi'\''/g' "$PICOM_CONFIG"

	# Restart picom to apply changes
	pkill picom
	picom --config ~/.config/picom/picom.conf &

	# Send notification
	notify-send "Transparency" "Switched to 100% opacity" -t 1500
else
	# Currently at 100%, switch to 80%
	sed -i 's/100:class_g = '\''Alacritty'\''/80:class_g = '\''Alacritty'\''/g' "$PICOM_CONFIG"
	sed -i 's/100:class_g = '\''kitty'\''/80:class_g = '\''kitty'\''/g' "$PICOM_CONFIG"
	sed -i 's/100:class_g = '\''URxvt'\''/80:class_g = '\''URxvt'\''/g' "$PICOM_CONFIG"
	sed -i 's/100:class_g = '\''Polybar'\''/80:class_g = '\''Polybar'\''/g' "$PICOM_CONFIG"
	sed -i 's/100:class_g = '\''Rofi'\''/80:class_g = '\''Rofi'\''/g' "$PICOM_CONFIG"

	# Restart picom to apply changes
	pkill picom
	picom --config ~/.config/picom/picom.conf &

	# Send notification
	notify-send "Transparency" "Switched to 80% opacity" -t 1500
fi
