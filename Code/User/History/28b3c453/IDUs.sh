#!/bin/bash

# Start tmux session
tmux new-session -d -s spotify_cava 'spotify'
# Split the window horizontally and run cava
tmux split-window -h 'cava'
# Attach to the tmux session
tmux -2 attach-session -d -t spotify_cava