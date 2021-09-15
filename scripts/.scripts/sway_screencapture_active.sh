#!/bin/bash

grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" ~/Pictures/scrn-$(date +"%Y-%m-%d-%H-%M-%S").png
