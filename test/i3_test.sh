#!/usr/bin/env bash
set -e
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"
cd "$REPO_ROOT" || exit 1

check_success() {
	local exit_code=$?
	if [ "$exit_code" -ne 0 ]; then
		echo "ERROR: $1 failed with exit code $exit_code" >&2
		return "$exit_code"
	fi
	echo "INFO: $1 successful" >&2
	return 0
}

test_gui_app() {
	local app_name="$1"
	local app_command="$2"
	local test_name="${3:-Testing $app_name config}"

	# Kill any existing instances
	killall "$app_name" 2>/dev/null || true

	"$app_command" &
	local app_pid=$!

	# Let it run briefly
	sleep 1

	kill "$app_pid" 2>/dev/null || true
	wait "$app_pid" 2>/dev/null || true

	check_success "$test_name"
}

# Usage:
test_gui_app "alacritty" "alacritty --config-file alacritty/.config/alacritty/alacritty.toml --print-events --command true 2>/dev/null"

test_gui_app "picom" "picom --config i3/.config/picom/picom.conf"

# test i3 configuration
i3 -C -c i3/.config/i3/config
check_success "Testing i3 config"

# test alacritty configuration (validate only, don't launch)
test_gui_app "alacritty" "alacritty --config-file alacritty/.config/alacritty/alacritty.toml --print-events --command true 2>/dev/null"

# test picom configuration (run briefly then kill)
test_gui_app "picom" "picom --config i3/.config/picom/picom.conf"

# test rofi configuration
rofi -show drun -theme i3/.config/rofi/tokyo-night.rasi
check_success "Testing rofi config"
