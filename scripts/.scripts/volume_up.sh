##!/bin/bash

isMuted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -hoE "yes|no")

if [[\
  $isMuted = "yes"
  ]]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | sed -En 's/^.* ([0-9]+)% .*$/\1/p' )


if [[\
    $volume -le 95\
    ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%   
else
    pactl set-sink-volume @DEFAULT_SINK@ 100%
fi

