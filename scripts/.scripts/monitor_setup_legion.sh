#!/bin/bash

if [[ "$#" == 3 ]]; then
  mode=$1
  builtin_screen=$2
  $external_primary=$3
elif [[ "$#" == 1 ]]; then
  mode=$1
  # 1920x1080 144hz
  external_primary="HDMI-0"
  # 1920x1200 144hz
  builtin_screen="eDP-1-0"
else
  echo 'Error: Invalid commandline arguments
  Usage:
  monitor_setup.sh mode [builtin_screen external_primary external_secondary]
  modes:
    - dual
    - single_external
    - single_builtin
  '
  exit 1
fi

pkill picom

if [ $mode == "dual" ]; then
  xrandr --output $builtin_screen --mode 1920x1200 --rate 144.0\
    --output $external_primary --mode 1920x1080 --rate 144.0 --left-of $builtin_screen

elif [ $mode == "single_external" ]; then
  xrandr --output $builtin_screen --off\
    --output $external_primary --mode 1920x1080 --rate 144.0 --left-of $builtin_screen

elif [ $mode == "single_builtin" ]; then
  xrandr --output $builtin_screen --primary --mode 1920x1200 --rate 144.00\
    --output $external_primary --off
else
  echo 'Error: mode
  modes
    - dual
    - single_external
    - single_builtin
  '
  exit 1
fi

picom &
feh --bg-fill ~/.background_images/minimalist_nord_arctic.png

# wait for monitors to load before applying polybar
sleep 2

polybar.sh

exit 0

