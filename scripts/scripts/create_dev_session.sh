#!/bin/bash

# Define the session name
SESSION_NAME="DEV"

# Get the current directory
CURRENT_DIR="$PWD"

# Start a new tmux session detached, starting in the current directory
tmux new-session -d -s "$SESSION_NAME" -c "$CURRENT_DIR"

# Create window 2 in the same directory
tmux new-window -t "$SESSION_NAME:2" -c "$CURRENT_DIR"

# Create window 3, run btop
tmux new-window -t "$SESSION_NAME:3" -n "btop" -c "$CURRENT_DIR" "btop"

# Select the first window
tmux select-window -t "$SESSION_NAME:1"

# Attach to the session
tmux attach-session -t "$SESSION_NAME"
