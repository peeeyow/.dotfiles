#!/bin/bash

chosen=$(printf "  Power Off\n  Restart\n  Logout" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"  Power Off") systemctl poweroff ;;
	"  Restart") systemctl reboot ;;
	"  Logout") swaymsg exit ;;
	*) exit 1 ;;
esac
