#!/bin/bash

if [[ "$#" == 3 ]]; then
  mode=$1
  primary=$2
  secondary=$3
elif [[ "$#" == 1 ]]; then
  mode=$1
  primary="HDMI-0"
  secondary="eDP-1-1"
else
  echo 'Error: Invalid commandline arguments
  Usage:
  monitor_setup.sh mode [primary_screen secondary_screen]
  modes:
    - dual
    - external
    - builtin
  '
  exit 1
fi

if [ $mode == "external" ]; then
  xrandr --output $primary --primary --mode 1920x1080 --rate 144.00 --scale 1.33334 --output $secondary --off
elif [ $mode == "builtin" ]; then
  xrandr --output $secondary --primary --mode 2560x1440 --rate 60.00 --output $primary --off
elif [ $mode == "dual" ]; then
  xrandr --output $secondary --mode 2560x1440 --rate 60.00 --output $primary --primary --mode 1920x1080 --rate 144.00 --panning 2560x1440+2560+0 --scale 1.3334 --right-of $secondary
else
  echo 'Error: mode
  modes:
    - dual
    - external
    - builtin
  '
  exit 1
fi

exit 0

