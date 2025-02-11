#!/bin/bash

# Kill existing instances
pkill -f spotify
pkill -f cava

# Start Cava in a fullscreen background terminal
foot --app-id cava-term cava &

# Wait for Cava to launch
sleep 1

# Start Spotify
spotify &

# Wait for Spotify to launch
sleep 3

# Move Spotify to the center and make it floating
hyprctl dispatch movewindow exact 50% 50%
hyprctl dispatch resizewindowpixel exact 1000 800
hyprctl dispatch togglefloating
