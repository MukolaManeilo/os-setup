#!/bin/bash

current_volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}' | cut -d'.' -f1)

max_volume=100

if [ "$current_volume" -lt "$max_volume" ]; then
    # Збільшити гучність на 5%, але не більше max_volume
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
fi
