#!/bin/bash

options="Dual\nSingle_External\nSingle_Builtin"

chosen=$(printf $options | rofi -dmenu -i -theme-str '@import "monitor_thinkpad.rasi"')

case "$chosen" in
  "Dual")                 $HOME/.scripts/monitor_setup_thinkpad.sh dual ;;
  "Single_External")      $HOME/.scripts/monitor_setup_thinkpad.sh single_external ;;
  "Single_Builtin")       $HOME/.scripts/monitor_setup_thinkpad.sh single_builtin ;;
	*) exit 1 ;;
esac
