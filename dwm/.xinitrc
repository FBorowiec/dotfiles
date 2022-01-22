#!/bin/bash

# invoke global X session script
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

feh --bg-fill /home/$USER/ansible/files/star_wars_last_supper.jpg
setxkbmap -option caps:escape

Day() {
  printf `date "+%e" | sed -e 's/\ //'`

  case `date +%d` in
    1|21|31) printf "${day}st";;
    2|22)    printf "${day}nd";;
    3|23)    printf "${day}rd";;
    *)       printf "${day}th";;
  esac
}

Battery() {
  dir=/sys/class/power_supply/BAT0

  grep -q ^C "${dir}"/status && printf +
  cat "${dir}"/capacity
}

while true; do
  xsetroot -name "`date \"+%a, %b \`Day\` %k:%M\"`" # | Battery: `Battery`%"
  sleep 15
done &

exec /usr/bin/dwm
