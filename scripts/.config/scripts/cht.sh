#!/usr/bin/env bash

selected=$(cat ~/.config/scripts/.tmux-cht-languages ~/.config/scripts/.tmux-cht-command | fzf)
if [[ -z $selected ]]; then
	exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.config/scripts/.tmux-cht-languages; then
	query=$(echo "$query" | tr ' ' '+')
	tmux neww bash -c "curl cht.sh/$selected/$(echo "$query" | tr ' ' '+') & while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl cht.sh/$selected+$query & while [ : ]; do sleep 1; done"
fi
