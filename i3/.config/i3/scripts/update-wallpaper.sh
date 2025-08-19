#!/bin/bash

WALLPAPER="/usr/share/backgrounds/star_wars_last_supper.jpg"
FEHBG_FILE="$HOME/.fehbg"

set_wallpaper() {
	feh --no-fehbg --bg-fill "$WALLPAPER"
	echo "#!/bin/sh" >"$FEHBG_FILE"
	echo "feh --no-fehbg --bg-fill '$WALLPAPER'" >>"$FEHBG_FILE"
	chmod +x "$FEHBG_FILE"
}

set_wallpaper

# Monitor for display changes via X11 events
while true; do
	xev -root -event randr | while read -r line; do
		if echo "$line" | grep -q "RRScreenChangeNotify"; then
			set_wallpaper
		fi
	done
done
