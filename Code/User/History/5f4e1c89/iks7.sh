#!/bin/bash

# Generate a minimal Cava config
CAVA_CONFIG=~/.config/cava/config
mkdir -p ~/.config/cava
cat <<EOF > $CAVA_CONFIG
[general]
bars = 30  # More bars for smooth animation
method = fft
framerate = 60
autosens = 1

[output]
method = raw
data_format = ascii
ascii_max_range = 8
bar_delimiter = 32
EOF

# Define bar height characters (from short to tall)
bars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

# Run Cava and process output dynamically
clear
cava -p $CAVA_CONFIG | while read -r line; do
    clear  # Refresh screen to avoid flickering
    bars_data=($line)
    
    for (( i=7; i>=0; i-- )); do  # Loop over heights from top to bottom
        line_output=""
        for bar in "${bars_data[@]}"; do
            if (( bar >= i )); then
                line_output+="█ "  # Fixed width block for consistency
            else
                line_output+="  "  # Empty space to simulate height drop
            fi
        done
        echo "$line_output"
    done
done
