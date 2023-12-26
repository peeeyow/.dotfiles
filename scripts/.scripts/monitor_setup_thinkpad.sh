#!/bin/bash

if [[ "$#" == 4 ]]; then
  mode=$1
  builtin_screen=$2
  external_primary=$3
  external_secondary=$4
elif [[ "$#" == 1 ]]; then
  mode=$1
  # 1080p 144hz
  external_primary="HDMI-A-2"
  # 1080p 75hz
  external_secondary="HDMI-0"
  # 1080p 60hz
  builtin_screen="eDP-1"
else
  echo 'Error: Invalid commandline arguments
  Usage:
  monitor_setup_thinkpad.sh mode [builtin_screen external_primary external_secondary]
  modes:
    - dual
    - single_external
    - single_builtin
  '
  exit 1
fi

if [ $mode == "dual" ]; then
  swaymsg output $builtin_screen enable pos 0 0 res 1920x1080@60Hz\
    bg ~/.background_images/minimalist_nord_arctic.png fill
  swaymsg output $external_primary enable pos 1920 0 res 1920x1080@144Hz\
    bg ~/.background_images/minimalist_nord_arctic.png fill

elif [ $mode == "single_external" ]; then
  swaymsg output $builtin_screen disable
  swaymsg output $external_primary enable pos 0 0 res 1920x1080@144Hz\
    bg ~/.background_images/minimalist_nord_arctic.png fill

elif [ $mode == "single_builtin" ]; then
  swaymsg output $builtin_screen enable pos 0 0 res 1920x1080@60Hz\
    bg ~/.background_images/minimalist_nord_arctic.png fill
  swaymsg output $external_primary disable
else
  echo 'Error: mode
  modes
    - dual
    - single_external
    - single_builtin
  '
  exit 1
fi

# wait for monitors to load before applying waybar
sleep 2

killall -SIGUSR2 waybar

exit 0

