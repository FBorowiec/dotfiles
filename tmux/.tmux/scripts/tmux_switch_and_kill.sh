#!/bin/bash

CURRENT_SESSION=$(tmux display-message -p '#S')
SESSION_COUNT=$(tmux list-sessions 2>/dev/null | wc -l)

if [ "$SESSION_COUNT" -gt 1 ]; then
	# Switch to the next session
	tmux switch-client -n

	# Kill the previous session
	tmux kill-session -t "$CURRENT_SESSION"
else
	notify-send "No other sessions to switch to."
fi
