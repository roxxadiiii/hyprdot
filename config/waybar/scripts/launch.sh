#!/bin/sh

pkill swaync
swaync > /dev/null 2>&1 &

# Refresh waybar
pkill waybar
waybar > /dev/null 2>&1 &
