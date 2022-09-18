#!/bin/bash

options="Dual_External\nDual_with_Vertical\nDual_with_Horizontal\nTriple_Full\nSingle_External\nSingle_Builtin"

chosen=$(printf $options | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
  "Dual_External")        monitor_setup.sh dual_external ;;
  "Dual_with_Vertical")   monitor_setup.sh dual_with_vertical ;;
  "Dual_with_Horizontal") monitor_setup.sh dual_with_horizontal ;;
  "Triple_Full")          monitor_setup.sh triple_full ;;
  "Single_External")      monitor_setup.sh single_external ;;
  "Single_Builtin")       monitor_setup.sh single_builtin ;;
	*) exit 1 ;;
esac
