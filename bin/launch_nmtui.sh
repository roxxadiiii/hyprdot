#!/bin/bash

# Script to launch nmtui in a floating, centered Kitty terminal window for Hyprland
# Window size: 1080x720 pixels

# Launch Kitty with nmtui
kitty \
    --class="floating-nmtui" \
    --title="nmtui-floating" \
    -o initial_window_width=1080 \
    -o initial_window_height=720 \
    -o remember_window_size=no \
    -o window_padding_width=10 \
    nmtui
