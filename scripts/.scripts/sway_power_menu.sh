#!/bin/bash
swaynag -t power -m '' -b ' Logout' 'swaymsg exit' -b '⏾ Sleep' 'clear; systemctl suspend' -b '⟳ Reboot' 'clear; systemctl reboot' -b ' Shutdown' 'clear; systemctl poweroff' -s 'Close'


