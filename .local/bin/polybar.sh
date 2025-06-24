#!/bin/bash

# Check if picom is running
if pgrep -x "polybar" > /dev/null
then
    killall polybar
else
    polybar &
fi

