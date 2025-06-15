#!/bin/sh
# Menu for powering off or rebooting the system.
printf "poweroff\nreboot\ncancel" | dmenu -i -l 3 -p "Quit?" | doas ${SHELL:-"/bin/sh"} &
