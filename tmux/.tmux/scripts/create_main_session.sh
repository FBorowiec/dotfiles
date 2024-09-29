#!/bin/bash

SESSION_NAME="Main"

# Check if the "Main" session already exists
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
	echo "Session '$SESSION_NAME' already exists."
else
	echo "Creating session '$SESSION_NAME'."
	# Create the "Main" session and set up windows
	tmux new-session -d -s "$SESSION_NAME" -n "Ranger" -c "$PWD" "ranger"
	tmux new-window -t "$SESSION_NAME:2" -n "Dotfiles" -c "$HOME/dotfiles"
	tmux new-window -t "$SESSION_NAME:3" -n "Ansible" -c "$HOME/ansible"
	tmux new-window -t "$SESSION_NAME:4" -n "Dev 1" -c "$HOME"
	tmux new-window -t "$SESSION_NAME:5" -n "Dev 2" -c "$HOME"
	tmux new-window -t "$SESSION_NAME:9" -n "BTOP" -c "$PWD" "btop"
	tmux select-window -t "$SESSION_NAME:1"
fi

if [ "$TMUX" != "" ]; then
	CURRENT_SESSION=$(tmux display-message -p '#S')
	if [ "$CURRENT_SESSION" != "$SESSION_NAME" ]; then
		echo "Switching from session '$CURRENT_SESSION' to '$SESSION_NAME'."
		tmux switch-client -t "$SESSION_NAME"
		tmux kill-session -t "$CURRENT_SESSION"
	else
		echo "Already in session '$SESSION_NAME'."
	fi
else
	echo "Attaching to session '$SESSION_NAME'."
	tmux attach-session -t "$SESSION_NAME"
fi
