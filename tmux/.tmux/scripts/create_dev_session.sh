#!/bin/bash

session_number=1
while true; do
	SESSION_NAME="DEV $session_number"
	if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
		session_number=$((session_number + 1))
	else
		break
	fi
done

tmux new-session -d -s "$SESSION_NAME" -n "Ranger" -c "$PWD" "ranger"
tmux new-window -t "$SESSION_NAME:2" -n "Dev 1" -c "$PWD"
tmux new-window -t "$SESSION_NAME:3" -n "Dev 2" -c "$PWD"
tmux new-window -t "$SESSION_NAME:9" -n "BTOP" -c "$PWD" "btop"
tmux select-window -t "$SESSION_NAME:1"

if [ "$TMUX" != "" ]; then
	tmux switch-client -t "$SESSION_NAME"
else
	tmux attach-session -t "$SESSION_NAME"
fi