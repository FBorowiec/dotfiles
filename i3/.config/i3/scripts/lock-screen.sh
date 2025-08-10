#!/bin/bash

# Lock screen script using betterlockscreen
pkill xautolock

betterlockscreen -l blur

xautolock -time 5 -locker "$HOME/.config/i3/scripts/lock-screen.sh" &