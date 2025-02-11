#!/bin/bash

# Generate a minimal Cava config
CAVA_CONFIG=~/.config/cava/config
mkdir -p ~/.config/cava
cat <<EOF > $CAVA_CONFIG
[general]
bars = 8
method = fft
framerate = 90
autosens = 1

[output]
method = raw
data_format = ascii
ascii_max_range = 8
bar_delimiter = 32
EOF

# Define bar characters from smallest to tallest
chars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

# Run Cava and process output dynamically
clear
cava -p $CAVA_CONFIG | while read -r line; do
    bars=($line)  # Read bars output from Cava
    output=""

    for bar in "${bars[@]}"; do
        char="${chars[$bar]}"   # Pick the correct height
        output+="█$char█ "  # Adds fixed width by surrounding with █
    done

    clear
    echo -e "$output"
done
