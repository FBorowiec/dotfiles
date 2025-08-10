#!/bin/bash

pkill xautolock 2>/dev/null

betterlockscreen --lock blur

# Restart xautolock if available
if command -v xautolock >/dev/null 2>&1; then
	xautolock -time 5 -locker "$HOME/.config/i3/scripts/lock-screen.sh" &
fi
