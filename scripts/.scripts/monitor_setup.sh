#!/bin/bash

sleep 0.1

primary="HDMI-0"
secondary="eDP-1-1"

monitor_count=$(xrandr --query | grep " connected" | wc -l)

if [[ $monitor_count == 1 ]]; then
  xrandr --output $secondary --primary --mode 2560x1440 --rate 60.00 --output $primary --off
else
  xrandr --output $secondary --mode 2560x1440 --rate 60.00 --output $primary --primary --mode 1920x1080 --rate 144.00 --panning 2560x1440+2560+0 --scale 1.3334 --right-of $secondary
fi
