#!/bin/sh

# Check if picom is running
if pgrep -x "picom" > /dev/null
then
	killall picom
else
    picom &
fi

