#!/bin/bash

# Generate a minimal Cava config
CAVA_CONFIG=~/.config/cava/config
mkdir -p ~/.config/cava
cat <<EOF > $CAVA_CONFIG
[general]
bars = 8
method = fft
framerate = 60
autosens = 1

[output]
method = raw
data_format = ascii
ascii_max_range = 8
bar_delimiter = 32

EOF

# Run Cava and process output
cava -p $CAVA_CONFIG | while read -r line; do
    bars=($line)
    output=""

    for bar in "${bars[@]}"; do
        chars=( " " "▁" "▂" "▃" "▅" "▆" "▇")  # Higher density bars
        output+="${chars[$bar]} "
    done

    echo "$output"
done
