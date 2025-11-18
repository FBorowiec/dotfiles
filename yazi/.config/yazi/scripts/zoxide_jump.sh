#!/bin/bash
# Zoxide directory jump for yazi

# Use zoxide to get directory list and fzf to select
SELECTED=$(zoxide query -l | fzf --height=100% --border --preview 'ls -la --color=always {}' --preview-window=right:50%)

if [ -n "$SELECTED" ]; then
    # Use ya to send cd command to yazi
    ya emit cd "$SELECTED"
fi
