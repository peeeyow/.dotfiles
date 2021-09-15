#!/bin/bash

maim -ui "$(xdotool getactivewindow)" $HOME/Pictures/scrn-$(date +"%Y-%m-%d-%H-%M-%S").png
