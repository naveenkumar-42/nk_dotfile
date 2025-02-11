#!/bin/bash

# Run Cava inside a floating Kitty terminal
kitty --class cava-term --override background_opacity=0.8 --hold cava
foot --app-id cava-term cava