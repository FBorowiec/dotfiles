#!/bin/bash

pkill xautolock 2>/dev/null

# Lock with a solid color (Tokyo Night background)
i3lock -c 1a1b26

# Restart xautolock if available
if command -v xautolock >/dev/null 2>&1; then
	xautolock -time 5 -locker "$HOME/.config/i3/scripts/lock-screen.sh" &
fi
