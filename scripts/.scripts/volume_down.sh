###!/bin/bash

isMuted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -hoE "yes|no")

if [[\
  $isMuted = "yes"
  ]]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

pactl set-sink-volume @DEFAULT_SINK@ -5%
