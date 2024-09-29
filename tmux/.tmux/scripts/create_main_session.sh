#!/bin/bash

SESSION_NAME="MAIN"
CURRENT_SESSION=$(tmux display-message -p '#S')

tmux new-session -d -s "$SESSION_NAME" -n "Ranger" -c "$HOME"
tmux new-window -t "$SESSION_NAME:2" -n "Dotfiles" -c "$HOME/dotfiles"
tmux new-window -t "$SESSION_NAME:3" -n "Ansible" -c "$HOME/ansible"
tmux new-window -t "$SESSION_NAME:4" -n "Dev 1" -c "$HOME"
tmux new-window -t "$SESSION_NAME:5" -n "Dev 2" -c "$HOME"
tmux new-window -t "$SESSION_NAME:6" -n "BTOP" -c "btop"
tmux select-window -t "$SESSION_NAME:1"

if [ "$TMUX" != "" ]; then
	tmux switch-client -t "$SESSION_NAME"
	tmux kill-session -t "$CURRENT_SESSION"
else
	tmux attach-session -t "$SESSION_NAME"
fi
