#!/bin/bash

chosen=$(printf "External\nBuiltin\nDual" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"External") monitor_setup.sh external ;;
	"Builtin") monitor_setup.sh builtin ;;
	"Dual") monitor_setup.sh dual ;;
	*) exit 1 ;;
esac
