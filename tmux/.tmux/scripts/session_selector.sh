#!/bin/bash

# List tmux sessions
sessions=$(tmux list-sessions -F "#{session_name}")

# Check if there are any sessions
if [ "$sessions" = "" ]; then
	echo "No tmux sessions found."
	exit 1
fi

# Use fzf to select a session, bind keys for navigation
selected=$(echo "$sessions" | fzf --height=10 --border --prompt="Select tmux session: " --bind=ctrl-j:down,ctrl-k:up --exit-0)

# Check if a session was selected
if [ "$selected" != "" ]; then
	tmux switch-client -t "$selected"
else
	echo "No session selected."
	exit 1
fi
