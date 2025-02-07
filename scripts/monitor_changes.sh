#!/bin/bash

# Watch for monitor changes using udev
udevadm monitor --subsystem-match=drm | while read -r line; do
    # Get current monitor configuration
    NEW_REFRESH_RATE=$(xrandr | grep 'connected' | grep 'primary' | awk '{print $3}' | cut -d'+' -f1 | cut -d'.' -f1)

    # Get the refresh rate value and apply it dynamically in Hyprland
    hyprctl keyword monitor "DP-2,2560x1440@${NEW_REFRESH_RATE},auto,1"

    # Optional: Print to log for debugging
    echo "Applied new refresh rate: ${NEW_REFRESH_RATE}"
done
