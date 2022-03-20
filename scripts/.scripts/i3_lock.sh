#!/bin/bash

scrot -o /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x20 /tmp/lockscreen.png

BACKGROUND='#282c34'
CLEAR='#ffffff22'
FOREGROUND='#abb2bf'
RED='#e06c75'
GREEN='#98c379'
BLUE='#61afef'
YELLOW='#e5c07b'
FONT='Fira-Mono'

i3lock \
  -i /tmp/lockscreen.png \
  --insidever-color=$CLEAR     \
  --ringver-color=$BLUE   \
  \
  --insidewrong-color=$CLEAR   \
  --ringwrong-color=$RED     \
  \
  --inside-color=$CLEAR        \
  --ring-color=$BACKGROUND        \
  --line-color=$FOREGROUND          \
  --separator-color=$YELLOW   \
  \
  --verif-color=$BLUE          \
  --wrong-color=$RED          \
  --time-color=$FOREGROUND           \
  --date-color=$FOREGROUND           \
  --layout-color=$FOREGROUND         \
  --keyhl-color=$YELLOW         \
  --bshl-color=$YELLOW          \
  \
  --screen 1                   \
  --blur 5                     \
  --clock                      \
  --indicator                  \
  --time-str="%H:%M:%S"        \
  --date-str="%A, %Y-%m-%d"    \
  --keylayout 1                \
  \
  --time-font=$FONT            \
  --date-font=$FONT            \
  --layout-font=$FONT          \
  --verif-font=$FONT           \
  --wrong-font=$FONT           \
  --greeter-font=$FONT         \
