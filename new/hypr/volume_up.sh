#!/bin/bash

MAX_VOLUME=110

CURRENT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

INCREMENT=5

NEW_VOLUME=$((CURRENT_VOLUME + INCREMENT))
if [ "$NEW_VOLUME" -gt "$MAX_VOLUME" ]; then
  NEW_VOLUME=$MAX_VOLUME
fi

pactl set-sink-volume @DEFAULT_SINK@ ${NEW_VOLUME}%
