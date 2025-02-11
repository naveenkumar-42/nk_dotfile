#!/bin/bash

# Generate a minimal Cava config
CAVA_CONFIG=~/.config/cava/config
mkdir -p ~/.config/cava
cat <<EOF > $CAVA_CONFIG
[general]
bars = 10
method = fft
framerate = 60
autosens = 1

[output]
method = raw
data_format = ascii
ascii_max_range = 8
bar_delimiter = 32
EOF

# Define the color palette
colors=("#FF0000" "#FF7F00" "#FFFF00" "#00FF00" "#0000FF" "#4B0082" "#8B00FF")

# Run Cava and process output
cava -p $CAVA_CONFIG | while read -r line; do
    bars=($line)
    output=""

    for bar in "${bars[@]}"; do
        color="${colors[$((RANDOM % ${#colors[@]}))]}" # Random RGB color
        chars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█") # Bar heights
        output+="<span color='$color'>${chars[$bar]}</span> "
    done

    echo "$output"
done
