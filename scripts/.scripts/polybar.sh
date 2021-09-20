#!/bin/bash

# terminate all running instances of polybar
killall -q polybar

# wait until killing stops
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar example 2>&1 | tee -a /tmp/example.log & disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
