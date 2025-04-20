#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd "$(dirname "$0")" || exit 1

currentBrightness=$(qdbus6 org.freedesktop.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl brightness)
brightnessMax=$(qdbus6 org.freedesktop.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl brightnessMax)
change="$1"
if [ "$1" = "" ]; then
    change=$(cat ../increment.conf)
fi
brightnessAfterChangePercentage=$(bc -l <<< "100 * ($currentBrightness / $brightnessMax) - $change")
actualBrightness=$(bc -l <<< "($brightnessAfterChangePercentage * $brightnessMax) / 100; scale=0")
if [ $(bc -l <<< "$brightnessAfterChange < 0") -eq 1 ]; then
    qdbus6 org.freedesktop.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness 0
    exit 0
fi
qdbus6 org.freedesktop.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness $(bc -l <<< "scale=0;$actualBrightness/1")

cd "$ORIGINAL_DIR" || exit 1
