#!/bin/bash

# Generate a minimal Cava config
CAVA_CONFIG=~/.config/cava/config
mkdir -p ~/.config/cava
cat <<EOF > $CAVA_CONFIG
[general]
bars = 8  # Number of bars (adjust for more detail)
method = fft
framerate = 60
autosens = 1

[output]
method = raw
data_format = ascii
ascii_max_range = 8
bar_delimiter = 32
EOF

# Define bar characters from small to tall
bars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

# Define colors based on height
colors=(
    "\e[38;5;33m"  # Level 0 - Blue
    "\e[38;5;34m"  # Level 1 - Green
    "\e[38;5;220m" # Level 2 - Yellow
    "\e[38;5;214m" # Level 3 - Orange
    "\e[38;5;196m" # Level 4 - Red
    "\e[38;5;201m" # Level 5 - Pink
    "\e[38;5;129m" # Level 6 - Purple
    "\e[38;5;15m"  # Level 7 - White
)

clear  # Clear terminal before starting

# Run Cava and process output dynamically
cava -p $CAVA_CONFIG | while read -r line; do
    clear  # Redraw fresh frame each time
    bars_data=($line)
    output=""

    for bar in "${bars_data[@]}"; do
        color="${colors[$bar]}"
        char="${bars[$bar]}"
        output+="$color$char\e[0m "  # Print bar with color
    done

    echo -e "$output"
done
