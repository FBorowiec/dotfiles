#!/bin/bash

# Brightness control script for polybar
# This script manages screen brightness adjustments

# Brightness step (percentage)
STEP=5

# Check if brightnessctl is available
if command -v brightnessctl &>/dev/null; then
	BRIGHTNESS_CMD="brightnessctl"
elif command -v xbacklight &>/dev/null; then
	# Test if xbacklight actually works
	if xbacklight -get &>/dev/null && [ "$(xbacklight -get)" != "" ]; then
		BRIGHTNESS_CMD="xbacklight"
	else
		BRIGHTNESS_CMD="sysfs"
	fi
else
	# Fallback to direct sysfs control
	BRIGHTNESS_CMD="sysfs"
fi

get_brightness() {
	if [ "$BRIGHTNESS_CMD" = "brightnessctl" ]; then
		# Get current brightness as percentage
		brightnessctl get | awk -v max="$(brightnessctl max)" '{printf "%.0f", ($1/max)*100}'
	elif [ "$BRIGHTNESS_CMD" = "xbacklight" ]; then
		xbacklight -get | awk '{printf "%.0f", $1}'
	else
		# Direct sysfs fallback
		BRIGHTNESS_PATH="/sys/class/backlight/intel_backlight"
		if [ ! -d "$BRIGHTNESS_PATH" ]; then
			BRIGHTNESS_PATH="/sys/class/backlight/$(ls /sys/class/backlight/ | head -n1)"
		fi

		if [ -d "$BRIGHTNESS_PATH" ]; then
			current=$(cat "$BRIGHTNESS_PATH/brightness")
			max=$(cat "$BRIGHTNESS_PATH/max_brightness")
			awk -v cur="$current" -v max="$max" 'BEGIN {printf "%.0f", (cur/max)*100}'
		else
			echo "0"
		fi
	fi
}

increase_brightness() {
	if [ "$BRIGHTNESS_CMD" = "brightnessctl" ]; then
		brightnessctl set "$STEP"%+
	elif [ "$BRIGHTNESS_CMD" = "xbacklight" ]; then
		xbacklight -inc "$STEP"
	else
		# This requires proper permissions
		BRIGHTNESS_PATH="/sys/class/backlight/intel_backlight"
		if [ ! -d "$BRIGHTNESS_PATH" ]; then
			BRIGHTNESS_PATH="/sys/class/backlight/$(ls /sys/class/backlight/ | head -n1)"
		fi

		if [ -d "$BRIGHTNESS_PATH" ]; then
			max=$(cat "$BRIGHTNESS_PATH/max_brightness")
			current=$(cat "$BRIGHTNESS_PATH/brightness")
			new=$((current + (max * STEP / 100)))

			if [ "$new" -gt "$max" ]; then
				new=$max
			fi

			echo "$new" | sudo tee "$BRIGHTNESS_PATH/brightness" >/dev/null
		fi
	fi

	new_brightness=$(get_brightness)
	notify-send "Brightness" "${new_brightness}%" -t 1500 -i display-brightness -h int:value:"$new_brightness"
}

decrease_brightness() {
	if [ "$BRIGHTNESS_CMD" = "brightnessctl" ]; then
		brightnessctl set "$STEP"%-
	elif [ "$BRIGHTNESS_CMD" = "xbacklight" ]; then
		xbacklight -dec "$STEP"
	else
		# This requires proper permissions
		BRIGHTNESS_PATH="/sys/class/backlight/intel_backlight"
		if [ ! -d "$BRIGHTNESS_PATH" ]; then
			BRIGHTNESS_PATH="/sys/class/backlight/$(ls /sys/class/backlight/ | head -n1)"
		fi

		if [ -d "$BRIGHTNESS_PATH" ]; then
			max=$(cat "$BRIGHTNESS_PATH/max_brightness")
			current=$(cat "$BRIGHTNESS_PATH/brightness")
			new=$((current - (max * STEP / 100)))

			if [ "$new" -lt 1 ]; then
				new=1
			fi

			echo "$new" | sudo tee "$BRIGHTNESS_PATH/brightness" >/dev/null
		fi
	fi

	new_brightness=$(get_brightness)
	notify-send "Brightness" "${new_brightness}%" -t 1500 -i display-brightness -h int:value:"$new_brightness"
}

status() {
	brightness=$(get_brightness)
	echo "󰃠   ${brightness}%"
}

case "$1" in
up)
	increase_brightness
	;;
down)
	decrease_brightness
	;;
status)
	status
	;;
*)
	status
	;;
esac
