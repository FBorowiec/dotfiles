#!/bin/bash

pkill xautolock

i3lock \
	--blur=5 \
	--bar-indicator \
	--bar-pos y+h \
	--bar-direction=1 \
	--bar-max-height=50 \
	--bar-base-width=50 \
	--bar-color=1a1b26cc \
	--keyhl-color=7aa2f7ff \
	--bar-periodic-step=50 \
	--bar-step=50 \
	--redraw-thread \
	--clock \
	--time-str="%H:%M" \
	--time-size=180 \
	--date-str="%A, %d %B" \
	--date-size=75 \
	--time-font="JetBrains Mono" \
	--date-font="JetBrains Mono" \
	--time-color=c0caf5ff \
	--date-color=565f89ff \
	--inside-color=1a1b2600 \
	--ring-color=414868ff \
	--line-uses-inside \
	--inside-ver-color=7aa2f7ff \
	--ring-ver-color=7aa2f7ff \
	--inside-wrong-color=f7768eff \
	--ring-wrong-color=f7768eff \
	--verif-text="Verifying..." \
	--wrong-text="Wrong Password" \
	--verif-color=c0caf5ff \
	--wrong-color=c0caf5ff

xautolock -time 5 -locker "$HOME/.config/i3/scripts/lock-screen.sh" &
