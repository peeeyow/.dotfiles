#!/bin/bash

exec xautolock -detectsleep -time 5 -locker betterlockscreen -notify 30 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seonds'"

exec xidlehook --not-when-fullscreen --timer 600 "systemctl suspend" -

