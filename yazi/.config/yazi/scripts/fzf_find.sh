#!/bin/bash
# FZF file finder for yazi

# Use fd to find files and pipe to fzf
SELECTED=$(fdfind --type f --hidden --follow --exclude .git | fzf --preview 'batcat --style=numbers --color=always {}' --preview-window=right:60%)

if [ -n "$SELECTED" ]; then
    # Return the full path
    realpath "$SELECTED"
fi
