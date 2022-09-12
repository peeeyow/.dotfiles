#!/bin/bash

# 1080p 144hz
external_primary="HDMI-0"
# 1080p 75hz
external_secondary=""
# 2560x1440 165hz
builtin_screen="eDP-1-1"

# xrandr
# mode -> scale -> rotation -> position (translation)

# Trio: vertical monitor sandwhich
# fb_w = 2560 (builtin_screen) + 1440 (vertical 1080p @ 1.33334 scale) + 2560 (Horizontal 1080p @ 1.333334)
#      = 6560
# fb_h = max 1440 (builtin_screen), 2560 (vertical 1080p @ 1.33334 scale), 1440 (Horizontal 1080p @ 1.333334)
#      = 2560
xrandr --fb 6560x2560 --output $builtin_screen --mode 2560x1440 --rate 165.00 --pos 0x0\
  --output $external_secondary --mode 1920x1080 --rate 75.00 --rotation left --scale 1.33334 --pos 2560x-560\
  --output $external_primary --primary --mode 1920x1080 --rate 144.00 --scale 1.33334 --pos 1440x0


# dual: external monitors
# fb_w = 1080 (vertical 1080p @ 1.33334 scale) + 1920 (Horizontal 1080p @ 1.333334)
#      = 3000
# fb_h = max 1920 (vertical 1080p @ 1.33334 scale), 1080 (Horizontal 1080p @ 1.333334)
#      = 1920
xrandr --fb 3000x1920\
  --output $external_secondary --mode 1920x1080 --rate 75.00 --rotation left --scale 1.33334 --pos 0x0\
  --output $external_primary --primary --mode 1920x1080 --rate 144.00 --scale 1.33334 --pos 1080x420
# lower dpi for lower zoom
# xrdb << EOF
# Xft.dpi: 100
# EOF



# NOTE: tested
# dual: builint + external vertical
# builtin is placed symetric vertically with recpect to vertical monitor
xrandr --fb 4000x2560 --output $builtin_screen --mode 2560x1440 --rate 165.00 --pos 0x0 --output $external_secondary --primary --mode 1920x1080 --rate 75.00 --rotation left --scale 1.33334 --pos 2560x-560

# NOTE: tested
# dual: builint + external horizontal
# builtin is placed symetric vertically with recpect to vertical monitor
xrandr --output $builtin_screen --mode 2560x1440 --rate 165.00 --output $external_primary --primary --mode 1920x1080 --rate 144.00 --scale 1.33334 --right-of $builtin_screen


exit 0

