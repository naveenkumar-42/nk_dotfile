#!/bin/bash

# Launch Spotify
spotify &

# Wait for Spotify to open (adjust if needed)
sleep 2

# Launch Cava in a floating Foot terminal with a custom class
foot --app-id cava-term cava &
