#!/bin/bash

options="    Lock\n 󰍃   Logout\n 󰒲   Suspend\n 󰤄   Hibernate\n    Reboot\n ⏻   Shutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme ~/.config/rofi/tokyo-night.rasi)

case $chosen in
*"Lock")
	~/.config/i3/scripts/lock-screen.sh
	;;
*"Logout")
	i3-msg exit
	;;
*"Suspend")
	systemctl suspend
	;;
*"Hibernate")
	systemctl hibernate
	;;
*"Reboot")
	systemctl reboot
	;;
*"Shutdown")
	systemctl poweroff
	;;
esac