#!/bin/bash
swaynag -t power -m '' -b ' Logout' 'swaymsg exit' -b '⏾ Sleep' 'systemctl suspend' -b '⟳ Reboot' 'systemctl reboot' -b ' Shutdown' 'systemctl poweroff' -s 'Close'


