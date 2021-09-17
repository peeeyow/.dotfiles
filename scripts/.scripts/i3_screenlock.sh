#!/bin/bash

TEMP_BG=/tmp/screenshot.png
TEMP_BLR=/tmp/blurshot.png

maim -u $TEMP_BG && convert $TEMP_BG -blur 0x7 $TEMP_BLR && rm $TEMP_BG && i3lock -i $TEMP_BLR && rm $TEMP_BLR

