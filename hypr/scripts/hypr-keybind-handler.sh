#!/bin/bash

KEY=$1
MIC_SOURCE=$(pactl list sources short | grep input | cut -f1 | head -n 1)

case "$KEY" in
    248)
        # Microphone toggle
        if [ -n "$MIC_SOURCE" ]; then
            pactl set-source-mute "$MIC_SOURCE" toggle
            notify-send "🎙️ Microphone toggled"
        else
            notify-send "❌ Microphone not found"
        fi
        ;;
    212)
        # Camera toggle
        if lsmod | grep uvcvideo &>/dev/null; then
            sudo modprobe -r uvcvideo && notify-send "📷 Camera Disabled"
        else
            sudo modprobe uvcvideo && notify-send "📷 Camera Enabled"
        fi
        ;;
    530)
        # Touchpad toggle
        TOUCHPAD_PATH=$(find /sys/class/input -name device | grep -i "asue120b.*touchpad" | head -n1)

        if [ -z "$TOUCHPAD_PATH" ]; then
            notify-send "❌ Touchpad device not found"
            exit 1
        fi

        PARENT_PATH=$(dirname "$TOUCHPAD_PATH")
        TOUCHPAD_ENABLED_PATH="$PARENT_PATH/enabled"

        if [ ! -f "$TOUCHPAD_ENABLED_PATH" ]; then
            notify-send "❌ Touchpad state file not found"
            exit 1
        fi

        CURRENT_STATE=$(cat "$TOUCHPAD_ENABLED_PATH")

        if [ "$CURRENT_STATE" -eq 1 ]; then
            echo 0 | sudo tee "$TOUCHPAD_ENABLED_PATH" >/dev/null
            notify-send "🖱️ Touchpad Disabled"
        else
            echo 1 | sudo tee "$TOUCHPAD_ENABLED_PATH" >/dev/null
            notify-send "🖱️ Touchpad Enabled"
        fi
        ;;
    *)
        notify-send "🔍 Unknown key: $KEY"
        ;;
esac
