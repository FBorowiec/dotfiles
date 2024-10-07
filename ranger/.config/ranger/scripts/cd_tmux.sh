#!/bin/bash

DIR="$1"
tmux new-window -n "$(basename "$DIR")" "cd $DIR; exec zsh"
