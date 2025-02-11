#!/bin/bash

# Define colors and bar height levels
colors=("#FF0000" "#FF7F00" "#FFFF00" "#00FF00" "#0000FF" "#4B0082" "#8B00FF")
chars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█") # Different heights

# Check for active audio playback
is_music_playing() {
    pactl list sink-inputs | grep -q "state: RUNNING"
}

while true; do
    if is_music_playing; then
        output=""
        
        # Generate 10 bars with random heights and colors
        for i in {1..10}; do
            height=$((RANDOM % ${#chars[@]})) # Random height
            color="${colors[$((RANDOM % ${#colors[@]}))]}" # Random color
            output+="<span color='$color'>${chars[$height]}</span> "
        done

        echo "$output"
    else
        echo ""  # Empty output when no music is playing
    fi

    sleep 0.2  # Adjust for smoother animation
done
