#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 1; done

# Launch polybar for each monitor
echo "---" | tee -a /tmp/polybar-main.log

# Launch bars for each monitor
monitors=($(polybar --list-monitors | cut -d":" -f1))
for m in "${monitors[@]}"; do
	MONITOR=$m polybar --reload main 2>&1 | tee -a /tmp/polybar-$m.log &
done

echo "Polybar launched..."
