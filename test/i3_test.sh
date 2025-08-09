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
	return 0
}

# test i3 configuration
i3 -C -c i3/.config/i3/config
check_success "Testing i3 config"

# test alacritty configuration
alacritty --config-file alacritty/.config/alacritty/alacritty.toml
check_success "Testing alacritty config"

# test picom configuration
killall picom 2>/dev/null || true
picom --config i3/.config/picom/picom.conf
check_success "Testing picom config"
