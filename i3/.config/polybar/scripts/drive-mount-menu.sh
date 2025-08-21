#!/bin/bash

unmounted_drives=$(lsblk -rno NAME,SIZE,LABEL,TYPE | grep -E '^sd[b-z].*part$|^nvme[1-9].*part$' | while read name size label type; do
	if ! mountpoint -q "/dev/$name" && [ ! -d "/media/$name" ] && [ "$(lsblk -no MOUNTPOINT "/dev/$name" | grep -v '^$')" = "" ]; then
		if [ "$label" != "" ]; then
			echo "$name ($size) - $label"
		else
			echo "$name ($size)"
		fi
	fi
done)

mounted_drives=$(lsblk -rno NAME,SIZE,LABEL,MOUNTPOINT | grep -E '^sd[b-z].*part |^nvme[1-9].*part ' | while read name size label mountpoint; do
	if [ "$mountpoint" != "" ] && [[ "$mountpoint" != "/" ]] && [[ "$mountpoint" != "/boot"* ]] && [[ "$mountpoint" != "/home" ]]; then
		if [ "$label" != "" ]; then
			echo "Unmount: $name ($size) - $label"
		else
			echo "Unmount: $name ($size)"
		fi
	fi
done)

if [ "$unmounted_drives" != "" ] || [ "$mounted_drives" != "" ]; then
	options=""
	if [ "$unmounted_drives" != "" ]; then
		options="$unmounted_drives"
	fi
	if [ "$mounted_drives" != "" ]; then
		if [ "$options" != "" ]; then
			options="$options\n$mounted_drives"
		else
			options="$mounted_drives"
		fi
	fi

	selected=$(echo -e "$options" | rofi -dmenu -p "External Drives" -theme ~/.config/rofi/tokyo-night.rasi)

	if [ "$selected" != "" ]; then
		drive_name=$(echo "$selected" | grep -o '^[^ ]*' | sed 's/Unmount://')

		if [[ "$selected" == "Unmount:"* ]]; then
			# Unmount drive
			if udisksctl unmount -b "/dev/$drive_name" 2>/dev/null; then
				notify-send "Drive Manager" "Unmounted /dev/$drive_name" -t 3000
			else
				notify-send "Drive Manager" "Failed to unmount /dev/$drive_name" -t 3000
			fi
		else
			# Mount drive
			if result=$(udisksctl mount -b "/dev/$drive_name" 2>&1); then
				mountpoint=$(echo "$result" | grep -o '/media/[^ ]*\|/run/media/[^ ]*')
				notify-send "Drive Manager" "Mounted /dev/$drive_name at $mountpoint" -t 3000
			else
				notify-send "Drive Manager" "Failed to mount /dev/$drive_name" -t 3000
			fi
		fi
	fi
else
	notify-send "Drive Manager" "No external drives detected" -t 2000
fi
