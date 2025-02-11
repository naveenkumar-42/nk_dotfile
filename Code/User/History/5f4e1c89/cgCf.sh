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

# Define a gradient color scheme (low -> high)
colors=("#FF0000" "#FF4500" "#FFA500" "#FFFF00" "#ADFF2F" "#32CD32" "#00FF7F" "#00FFFF" "#1E90FF" "#0000FF" "#8A2BE2")

# Run Cava and process output
cava -p $CAVA_CONFIG | while read -r line; do
    bars=($line)
    output=""

    for bar in "${bars[@]}"; do
        # Assign color based on height
        color="${colors[$bar]}"
        chars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" "█" "█")  # Higher density
        output+="<span color='$color'>${chars[$bar]}</span> "
    done

    echo "$output"
done
