#!/bin/bash
# Open a new tmux window in the selected directory

if [ -d "$1" ]; then
    DIR="$1"
else
    # If it's a file, use its parent directory
    DIR="$(dirname "$1")"
fi

tmux new-window -n "$(basename "$DIR")" "cd \"$DIR\"; exec zsh"
