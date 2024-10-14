#!/bin/bash

pane_pid=$(tmux display -p -t "$TMUX_PANE" "#{pane_pid}")

get_last_cmd() {
	pid=$1
	while true; do
		child_pids=$(pgrep -P "$pid")
		if [ "$child_pids" = "" ]; then
			cmd=$(ps -p "$pid" -o comm=)
			echo "$cmd"
			break
		else
			pid=$(echo "$child_pids" | head -n 1)
		fi
	done
}

cmd=$(get_last_cmd "$pane_pid")

if [ "$cmd" = "ranger" ]; then
	tmux send-keys -t "$TMUX_PANE" C-f
elif [ "$cmd" = "nvim" ] || [ "$cmd" = "vim" ]; then
	# Disable for nvim
	:
else
	tmux send-keys -t "$TMUX_PANE" 'fdfind --type f | fzf --border --margin=0,1 --preview "bat -f -P --plain {}" | xargs -r nvim' Enter
fi
