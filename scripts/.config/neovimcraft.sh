#!/usr/bin/env bash

selected=$(cat ~/.config/.tmux-nvim | fzf)
if [[ -z $selected ]]; then
	exit 0
fi

if [[ "$selected" == "help" ]]; then
	tmux neww bash -c "curl https://nvim.sh & while [ : ]; do sleep 1; done"
elif [[ "$selected" == "find-plugin" ]]; then
	read -p "Search plugin: " query
	tmux neww bash -c "curl https://nvim.sh/s/$(echo "$query" | tr ' ' '-') & while [ : ]; do sleep 1; done"
elif [[ "$selected" == "plugins" ]]; then
	tmux neww bash -c "curl https://nvim.sh/s & while [ : ]; do sleep 1; done"
elif [[ "$selected" == "tags" ]]; then
	selected_tag=$(curl -s https://nvim.sh/t | fzf)
	tmux neww bash -c "curl https://nvim.sh/t/$(echo "$selected_tag" | tr ' ' '-') && while [ : ]; do sleep 1; done"
fi
