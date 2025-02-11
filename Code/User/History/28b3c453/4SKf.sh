#!/bin/bash

# Launch Spotify
spotify &

# Wait for Spotify to launch
sleep 2

# Launch Cava in a floating terminal
foot --title="Cava Visualizer" cava
