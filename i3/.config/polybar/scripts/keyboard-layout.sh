#!/bin/bash

# Cycle through keyboard layouts: US -> Polish -> French -> Italian -> US
current=$(setxkbmap -query | grep layout | awk '{print $2}')

case $current in
"us")
	setxkbmap pl
	notify-send "Keyboard Layout" "Switched to Polish (PL)" -t 1000
	;;
"pl")
	setxkbmap fr
	notify-send "Keyboard Layout" "Switched to French (FR)" -t 1000
	;;
"fr")
	setxkbmap it
	notify-send "Keyboard Layout" "Switched to Italian (IT)" -t 1000
	;;
"it")
	setxkbmap us
	notify-send "Keyboard Layout" "Switched to US English (US)" -t 1000
	;;
*)
	# Default to US if unknown layout
	setxkbmap us
	notify-send "Keyboard Layout" "Switched to US English (US)" -t 1000
	;;
esac
