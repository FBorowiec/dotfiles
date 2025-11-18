#!/bin/bash
# Open nvim in a new tmux window for the selected file/directory

if [ -d "$1" ]; then
    # If it's a directory, open nvim in that directory
    tmux new-window -n "$(basename "$1")" "cd \"$1\" && nvim"
else
    # If it's a file, open the file in nvim
    DIR="$(dirname "$1")"
    FILE="$(basename "$1")"
    tmux new-window -n "$FILE" "cd \"$DIR\" && nvim \"$FILE\""
fi
