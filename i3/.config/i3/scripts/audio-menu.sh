#!/bin/bash

# Clean up temp files from previous runs
rm -f /tmp/audio_sinks /tmp/audio_sources

# Get current default sink and source
current_sink=$(pactl get-default-sink)
current_source=$(pactl get-default-source)

# Get all available sinks (outputs)
sinks=$(pactl list short sinks | while read -r line; do
	sink_id=$(echo "$line" | cut -f1)
	sink_name=$(echo "$line" | cut -f2)
	sink_desc=$(pactl list sinks | grep -A20 "Name: $sink_name" | grep "Description:" | cut -d':' -f2- | sed 's/^[[:space:]]*//')

	if [ "$sink_name" = "$current_sink" ]; then
		echo " [ACTIVE] $sink_desc"
	else
		echo " $sink_desc"
	fi
	echo "$sink_id:$sink_name:$sink_desc" >>/tmp/audio_sinks
done)

# Get all available sources (inputs)
sources=$(pactl list short sources | grep -v monitor | while read -r line; do
	source_id=$(echo "$line" | cut -f1)
	source_name=$(echo "$line" | cut -f2)
	source_desc=$(pactl list sources | grep -A20 "Name: $source_name" | grep "Description:" | cut -d':' -f2- | sed 's/^[[:space:]]*//')

	if [ "$source_name" = "$current_source" ]; then
		echo " [ACTIVE] $source_desc"
	else
		echo " $source_desc"
	fi
	echo "$source_id:$source_name:$source_desc" >>/tmp/audio_sources
done)

# Build menu
options="── Audio Outputs ──\n$sinks\n── Audio Inputs ──\n$sources\n── Controls ──\n🔄 Restart PulseAudio\n📊 Open PulseAudio Control"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Audio Devices" -theme ~/.config/rofi/tokyo-night.rasi)

case $chosen in
"  [ACTIVE]"* | "  "*)
	# Extract description and find corresponding sink
	desc=$(echo "$chosen" | sed 's/^🔊 \[ACTIVE\] //; s/^🔊 //; s/^🔇 //')
	sink_name=$(grep ":$desc$" /tmp/audio_sinks | cut -d':' -f2)
	if [ "$sink_name" != "" ]; then
		pactl set-default-sink "$sink_name"
		notify-send "Audio" "Output switched to: $desc" -t 2000

		# Move all playing streams to new sink
		pactl list short sink-inputs | cut -f1 | while read -r stream; do
			pactl move-sink-input "$stream" "$sink_name" 2>/dev/null
		done
	fi
	;;
"🎤 [ACTIVE]"* | "🎙️ "*)
	# Extract description and find corresponding source
	desc=$(echo "$chosen" | sed 's/^🎤 \[ACTIVE\] //; s/^🎙️ //')
	source_name=$(grep ":$desc$" /tmp/audio_sources | cut -d':' -f2)
	if [ "$source_name" != "" ]; then
		pactl set-default-source "$source_name"
		notify-send "Audio" "Input switched to: $desc" -t 2000
	fi
	;;
"🔄 Restart PulseAudio")
	pulseaudio -k
	sleep 2
	pulseaudio --start
	notify-send "Audio" "PulseAudio restarted" -t 2000
	;;
"📊 Open PulseAudio Control")
	pavucontrol &
	;;
esac

# Clean up temp files
rm -f /tmp/audio_sinks /tmp/audio_sources
