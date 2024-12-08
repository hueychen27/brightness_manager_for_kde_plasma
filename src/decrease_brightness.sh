#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd "$(dirname "$0")" || exit 1

currentBrightness=$(qdbus6 local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl brightness)
brightnessMax=$(qdbus6 local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl brightnessMax)
change=$1
if [[ $1 == "" ]]; then
    change=$(cat ../increment.conf)
fi
if [[ $(echo "$((currentBrightness / 960)) - $change < 0" | bc -l) -eq 1 ]]; then
    qdbus6 local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness 0
    exit 0
fi
math="($brightnessMax * (( ($currentBrightness / 100) - $change) / 100))"
qdbus6 local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness "$(bc -l <<<"scale=0;$(bc -l <<<"$math")/1")"

cd "$ORIGINAL_DIR" || exit 1