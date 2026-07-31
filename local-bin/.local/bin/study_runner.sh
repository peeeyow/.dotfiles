#!/usr/bin/env bash

set -euxo pipefail

if [[ $# -eq 1 ]]; then
  file=$1
else
  file=$(
    fd --extension pdf . ~/workfiles/books/ |
    rofi -dmenu -p "PDF path" -theme-str '@import "study_runner.rasi"'
  )
fi


[[ -n "$file" ]] || exit 0

notify-send "Opening $file"

i3-msg workspace '2:code'
setsid -f zathura "$file" >/dev/null 2>&1
sleep 1.5

i3-msg workspace '3:term'
setsid -f kitty --directory ~/obsidian/main-vault/ >/dev/null 2>&1
sleep 1.5

i3-msg workspace '4:docs'
setsid -f /opt/obsidian.AppImage >/dev/null 2>&1
sleep 5

i3-msg workspace '10:discord'
setsid -f flatpak run net.ankiweb.Anki >/dev/null 2>&1
sleep 3

i3-msg workspace '2:code'

