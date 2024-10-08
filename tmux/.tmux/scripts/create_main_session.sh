#!/bin/bash

SESSION_NAME="Main"

display_message() {
	if [ "$TMUX" != "" ]; then
		tmux display-message -d 1000 "$1"
	else
		echo "$1"
	fi
}

if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
	display_message "Session '$SESSION_NAME' already exists. Attaching to it."
else
	display_message "Creating session '$SESSION_NAME'."
	tmux new-session -d -s "$SESSION_NAME" -n "ranger" -c "$PWD" "ranger"
	tmux new-window -t "$SESSION_NAME:2" -n "dotfiles" -c "$HOME/dotfiles"
	tmux new-window -t "$SESSION_NAME:3" -n "ansible" -c "$HOME/ansible"
	tmux new-window -t "$SESSION_NAME:4" -n "zsh" -c "$HOME"
	tmux new-window -t "$SESSION_NAME:9" -n "btop" -c "$PWD" "btop"
	tmux select-window -t "$SESSION_NAME:1"
fi

if [ "$TMUX" != "" ]; then
	CURRENT_SESSION=$(tmux display-message -p '#S')
	if [ "$CURRENT_SESSION" != "$SESSION_NAME" ]; then
		display_message "Switching from session '$CURRENT_SESSION' to '$SESSION_NAME'."
		tmux switch-client -t "$SESSION_NAME"
		tmux kill-session -t "$CURRENT_SESSION"
	else
		display_message "Already in session '$SESSION_NAME'."
	fi
else
	display_message "Attaching to session '$SESSION_NAME'."
	tmux attach-session -t "$SESSION_NAME"
fi
