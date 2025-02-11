#!/bin/bash

# Create a temporary Cava config
TEMP_CAVA_CONFIG=$(mktemp)
mkdir -p ~/.config/cava
cat <<EOF > $TEMP_CAVA_CONFIG
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

# Run Cava with the temporary config and process output
cava -p $TEMP_CAVA_CONFIG | while read -r line; do
    bars=($line)
    output=""

    for bar in "${bars[@]}"; do
        chars=("▁" "▂" "▃" "▄" "▅" "▇" "█")  # Full range of blocks
        output+="${chars[$bar]} "
    done

    echo "$output"
done

# Remove temporary config after execution
rm "$TEMP_CAVA_CONFIG"
