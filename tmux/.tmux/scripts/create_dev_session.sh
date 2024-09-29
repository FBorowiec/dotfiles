#!/bin/bash

display_message() {
	if [ "$TMUX" != "" ]; then
		tmux display-message -d 1000 "$1"
	else
		echo "$1"
	fi
}

if [ "$1" != "" ]; then
	# Session name provided as an argument
	SESSION_NAME="$1"
else
	# No session name provided, generate "DEV N"
	session_number=1
	while true; do
		SESSION_NAME="DEV $session_number"
		if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
			session_number=$((session_number + 1))
		else
			break
		fi
	done
fi

# Check if the session already exists
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
	display_message "Session '$SESSION_NAME' already exists. Attaching to it."
else
	display_message "Creating session '$SESSION_NAME'."
	# Create the session and windows
	tmux new-session -d -s "$SESSION_NAME" -n "Ranger" -c "$PWD" "ranger"
	tmux new-window -t "$SESSION_NAME:2" -n "Dev 1" -c "$PWD"
	tmux new-window -t "$SESSION_NAME:3" -n "Dev 2" -c "$PWD"
	tmux new-window -t "$SESSION_NAME:9" -n "BTOP" -c "$PWD" "btop"
	tmux select-window -t "$SESSION_NAME:1"
fi

# Attach to the session
if [ "$TMUX" != "" ]; then
	tmux switch-client -t "$SESSION_NAME"
else
	tmux attach-session -t "$SESSION_NAME"
fi
