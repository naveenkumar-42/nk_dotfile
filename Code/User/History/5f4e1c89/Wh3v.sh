#!/bin/bash

# Generate a minimal Cava config
CAVA_CONFIG=~/.config/cava/config
mkdir -p ~/.config/cava
cat <<EOF > $CAVA_CONFIG
[general]
bars = 20  # More bars for a smoother effect
method = fft
framerate = 60
autosens = 1

[output]
method = raw
data_format = ascii
ascii_max_range = 8
bar_delimiter = 32
EOF

# Define color gradient
colors=(
    "#00ffff" "#00dfff" "#00bfff" "#009fff" "#007fff" 
    "#005fff" "#003fff" "#001fff" "#ff00ff"
)

# Run Cava and process output
cava -p $CAVA_CONFIG | while read -r line; do
    bars=($line)
    output=""

    for bar in "${bars[@]}"; do
        color="${colors[$bar]}"
        output+="<span color='$color'>█</span> "
    done

    echo -e "$output"
done
