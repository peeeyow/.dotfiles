#!/bin/bash

# terminate all running instances of polybar
killall -q polybar

# wait until killing stops
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch mainbar
# polybar main 2>&1 | tee -a /tmp/main.log & disown

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
