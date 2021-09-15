#!/bin/bash

maim -ui "$(xdotool getactivewindow)" | xclip -selection clipboard -t image/png

