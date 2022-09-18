#!/bin/bash

if [[ "$#" == 4 ]]; then
  mode=$1
  builtin_screen=$2
  $external_primary=$3
  $external_secondary=$4
elif [[ "$#" == 1 ]]; then
  mode=$1
  # 1080p 144hz
  external_primary="DP-0"
  # 1080p 75hz
  external_secondary="HDMI-0"
  # 2560x1440 165hz
  builtin_screen="eDP-1-1"
else
  echo 'Error: Invalid commandline arguments
  Usage:
  monitor_setup.sh mode [builtin_screen external_primary external_secondary]
  modes:
    - dual_external
    - dual_with_vertical
    - dual_with_horizontal
    - triple_full
    - single_external
    - single_builtin
  '
  exit 1
fi

if [ $mode == "dual_external" ]; then
  xrandr --fb 4000x2560\
    --output $external_secondary --mode 1920x1080 --rate 75.00 --rotation left --scale 1.33334 --pos 0x0\
    --output $external_primary --primary --mode 1920x1080 --rate 144.00 --scale 1.33334 --pos 1440x560\
    --output $builtin_screen --off

  feh --bg-fill ~/.background_images/minimalist_nord_arctic.png ~/.background_images/fedora_nord.png

elif [ $mode == "dual_with_horizontal" ]; then
  xrandr --output $builtin_screen --mode 2560x1440 --rate 165.00\
    --output $external_primary --primary --mode 1920x1080 --rate 144.00 --scale 1.33334 --right-of $builtin_screen\
    --output $external_secondary --off

  feh --bg-fill ~/.background_images/minimalist_nord_arctic.png

elif [ $mode == "dual_with_vertical" ]; then
  xrandr --fb 4000x2560\
    --output $builtin_screen --primary --mode 2560x1440 --rate 165.00 --pos 0x0\
    --output $external_secondary --mode 1920x1080 --rate 75.00 --rotation left --scale 1.33334 --pos 2560x-560\
    --output $external_primary --off

  feh --bg-fill ~/.background_images/minimalist_nord_arctic.png ~/.background_images/fedora_nord.png

elif [ $mode == "triple_full" ]; then
  xrandr --fb 6560x2560 --output $builtin_screen --mode 2560x1440 --rate 165.00 --pos 0x0\
    --output $external_secondary --mode 1920x1080 --rate 75.00 --rotation left --scale 1.33334 --pos 2560x-560\
    --output $external_primary --primary --mode 1920x1080 --rate 144.00 --scale 1.33334 --pos 4000x0

  feh --bg-fill ~/.background_images/minimalist_nord_arctic.png ~/.background_images/fedora_nord.png ~/.background_images/minimalist_nord_arctic.png

elif [ $mode == "single_external" ]; then
  xrandr --output $external_primary --primary --mode 1920x1080 --rate 144.00 --scale 1.33334\
    --output $external_secondary --off\
    --output $builtin_screen --off

  feh --bg-fill ~/.background_images/minimalist_nord_arctic.png

elif [ $mode == "single_builtin" ]; then
  xrandr --output $builtin_screen --primary --mode 2560x1440 --rate 165.00\
    --output $external_primary --off\
    --output $external_secondary --off
  
  feh --bg-fill ~/.background_images/minimalist_nord_arctic.png

else
  echo 'Error: mode
  modes
    - dual_external
    - dual_with_vertical
    - dual_with_horizontal
    - triple_full
    - single_external
    - single_builtin
  '
  exit 1
fi

# wait for monitors to load before applying polybar
sleep 2

polybar.sh


exit 0

