#!/bin/bash

if tmux ls >/dev/null 2>&1; then
	tmux attach
else
	/bin/bash -c "'$HOME'/.tmux/scripts/create_main_session.sh"
fi
