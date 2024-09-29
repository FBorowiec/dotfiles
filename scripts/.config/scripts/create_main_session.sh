#!/bin/bash

SESSION_NAME="Main"

tmux new-session -d -s "$SESSION_NAME" -n "Ranger" -c "$PWD" "ranger"
tmux new-window -t "$SESSION_NAME:2" -c "$HOME/dotfiles" "nvim" -n "Dotfiles"
tmux new-window -t "$SESSION_NAME:3" -c "$HOME/ansible" "nvim" -n "Ansible"
tmux new-window -t "$SESSION_NAME:5" -c "$PWD" -n "Dev 1"
tmux new-window -t "$SESSION_NAME:6" -c "$PWD" -n "Dev 2"
tmux new-window -t "$SESSION_NAME:7" -n "BTOP" -c "$PWD" "btop"
tmux select-window -t "$SESSION_NAME:1"

if [ "$TMUX" != "" ]; then
	tmux switch-client -t "$SESSION_NAME"
else
	tmux attach-session -t "$SESSION_NAME"
fi
