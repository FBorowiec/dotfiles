#!/usr/bin/env bash

scripts_path="$HOME/.tmux/scripts"
languages="$scripts_path"/.tmux-cht-languages
commands="$scripts_path"/.tmux-cht-command

selected=$(cat "$languages" "$commands" | fzf)
if [[ -z $selected ]]; then
	exit 0
fi

read -rp "Enter Query: " query

if grep -qs "$selected" "$languages"; then
	query=$(echo "$query" | tr ' ' '+')
	tmux neww bash -c "curl cht.sh/$selected/$(echo "$query" | tr ' ' '+') & while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl cht.sh/$selected+$query & while [ : ]; do sleep 1; done"
fi
