#!/bin/bash

grim /tmp/screenshot.png && convert /tmp/screenshot.png -blur 0x7 /tmp/blurshot.png && rm /tmp/screenshot.png && swaylock -i /tmp/blurshot.png && rm /tmp/blurshot.png &
