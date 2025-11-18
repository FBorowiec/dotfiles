#!/bin/bash
# FZF file jump for yazi

# Use rg to find files and fzf to select
SELECTED=$(rg --files | fzf --height=100% --border --preview 'batcat --style=numbers --color=always {}')

if [ -n "$SELECTED" ]; then
    # Use ya to send reveal command to yazi
    ya emit reveal "$PWD/$SELECTED"
fi
