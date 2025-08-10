#!/bin/bash

# Display management menu for i3
# Manage multiple monitors and display settings

# Get connected displays
displays=$(xrandr | grep " connected" | cut -d' ' -f1)
primary_display=$(xrandr | grep "primary" | cut -d' ' -f1)

# Build display options
options="📺 Display Settings\n"

# Add individual display options
for display in "${displays[@]}"; do
	if [ "$display" = "$primary_display" ]; then
		options="$options🖥️ [PRIMARY] $display\n"
	else
		options="$options📱 $display\n"
	fi
done

options="$options── Presets ──\n"
options="$options💻 Laptop Only\n"
options="$options🖥️ External Only\n"
options="$options🔄 Mirror Displays\n"
options="$options➡️ Extend Right\n"
options="$options⬅️ Extend Left\n"
options="$options↕️ Extend Above/Below\n"
options="$options🔧 Advanced Settings (arandr)\n"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Display" -theme ~/.config/rofi/tokyo-night.rasi)

case $chosen in
"💻 Laptop Only")
	# Turn off all external displays and use only laptop
	while read -r display; do
		if [ "$display" != "eDP-1" ] && [ "$display" != "LVDS-1" ] && [ "$display" != "" ]; then
			xrandr --output "$display" --off
		fi
	done <<<"$displays"
	# Set laptop display as primary and ensure it's on
	xrandr --output eDP-1 --primary --auto 2>/dev/null || xrandr --output LVDS-1 --primary --auto
	notify-send "Display" "Using laptop display only" -t 2000
	;;
"🖥️ External Only")
	# Use external monitor as primary and turn off laptop
	external=$(echo "$displays" | grep -v "eDP-1\|LVDS-1" | head -1)
	if [ "$external" != "" ]; then
		xrandr --output "$external" --primary --auto
		xrandr --output eDP-1 --off 2>/dev/null || xrandr --output LVDS-1 --off
		notify-send "Display" "Using external display only: $external" -t 2000
	else
		notify-send "Display" "No external display found" -t 2000
	fi
	;;
"🔄 Mirror Displays")
	external=$(echo "$displays" | grep -v "eDP-1\|LVDS-1" | head -1)
	if [ "$external" != "" ]; then
		xrandr --output eDP-1 --auto --output "$external" --auto --same-as eDP-1 2>/dev/null ||
			xrandr --output LVDS-1 --auto --output "$external" --auto --same-as LVDS-1
		notify-send "Display" "Mirroring displays" -t 2000
	fi
	;;
"➡️ Extend Right")
	external=$(echo "$displays" | grep -v "eDP-1\|LVDS-1" | head -1)
	if [ "$external" != "" ]; then
		xrandr --output eDP-1 --primary --auto --output "$external" --auto --right-of eDP-1 2>/dev/null ||
			xrandr --output LVDS-1 --primary --auto --output "$external" --auto --right-of LVDS-1
		notify-send "Display" "Extended display to the right" -t 2000
	fi
	;;
"⬅️ Extend Left")
	external=$(echo "$displays" | grep -v "eDP-1\|LVDS-1" | head -1)
	if [ "$external" != "" ]; then
		xrandr --output eDP-1 --primary --auto --output "$external" --auto --left-of eDP-1 2>/dev/null ||
			xrandr --output LVDS-1 --primary --auto --output "$external" --auto --left-of LVDS-1
		notify-send "Display" "Extended display to the left" -t 2000
	fi
	;;
"↕️ Extend Above/Below")
	external=$(echo "$displays" | grep -v "eDP-1\|LVDS-1" | head -1)
	if [ "$external" != "" ]; then
		# Try above first, then below
		xrandr --output eDP-1 --primary --auto --output "$external" --auto --above eDP-1 2>/dev/null ||
			xrandr --output eDP-1 --primary --auto --output "$external" --auto --below eDP-1 2>/dev/null ||
			xrandr --output LVDS-1 --primary --auto --output "$external" --auto --above LVDS-1 2>/dev/null ||
			xrandr --output LVDS-1 --primary --auto --output "$external" --auto --below LVDS-1
		notify-send "Display" "Extended display vertically" -t 2000
	fi
	;;
"🔧 Advanced Settings (arandr)")
	arandr &
	;;
"🖥️ [PRIMARY]"* | "📱 "*)
	# Individual display settings
	display_name=$(echo "$chosen" | sed 's/^🖥️ \[PRIMARY\] //; s/^📱 //')
	display_options="🔆 Set as Primary\n📏 Change Resolution\n🔄 Rotate Display\n❌ Turn Off"

	display_choice=$(echo -e "$display_options" | rofi -dmenu -i -p "$display_name" -theme ~/.config/rofi/tokyo-night.rasi)

	case $display_choice in
	"🔆 Set as Primary")
		xrandr --output "$display_name" --primary
		notify-send "Display" "$display_name set as primary" -t 2000
		;;
	"📏 Change Resolution")
		resolutions=$(xrandr | grep -A20 "^$display_name " | grep "^ " | awk '{print $1}' | head -10)
		chosen_res=$(echo "$resolutions" | rofi -dmenu -i -p "Resolution for $display_name" -theme ~/.config/rofi/tokyo-night.rasi)
		if [ "$chosen_res" != "" ]; then
			xrandr --output "$display_name" --mode "$chosen_res"
			notify-send "Display" "$display_name resolution set to $chosen_res" -t 2000
		fi
		;;
	"🔄 Rotate Display")
		rotations="normal\nleft\nright\ninverted"
		chosen_rot=$(echo -e "$rotations" | rofi -dmenu -i -p "Rotation for $display_name" -theme ~/.config/rofi/tokyo-night.rasi)
		if [ "$chosen_rot" != "" ]; then
			xrandr --output "$display_name" --rotate "$chosen_rot"
			notify-send "Display" "$display_name rotated to $chosen_rot" -t 2000
		fi
		;;
	"❌ Turn Off")
		xrandr --output "$display_name" --off
		notify-send "Display" "$display_name turned off" -t 2000
		;;
	esac
	;;
esac

# Restart polybar to adjust to new display configuration
pkill polybar
~/.config/polybar/launch.sh &
