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
	# No session name provided, generate "Term N"
	session_number=1
	while true; do
		SESSION_NAME="Term $session_number"
		if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
			session_number=$((session_number + 1))
		else
			break
		fi
	done
fi

if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
	display_message "Session '$SESSION_NAME' already exists. Attaching to it."
else
	display_message "Creating session '$SESSION_NAME'."
	tmux new-session -d -s "$SESSION_NAME" -n "Ranger" -c "$PWD" "ranger"
	tmux new-window -t "$SESSION_NAME:2" -n "Term" -c "$PWD"
	tmux new-window -t "$SESSION_NAME:9" -n "BTOP" -c "$PWD" "btop"
	tmux select-window -t "$SESSION_NAME:1"
fi

if [ "$TMUX" != "" ]; then
	tmux switch-client -t "$SESSION_NAME"
else
	tmux attach-session -t "$SESSION_NAME"
fi
