#!/bin/bash
currentBrightness=$(qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl brightness)
brightnessMax=$(qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl brightnessMax)
change=$1
if [[ $1 == "" ]]; then
    change=1
fi
if [[ $(((currentBrightness / 960) - change)) -lt 0 ]]; then
    qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness 0
    exit 0
fi
qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness "$(bc -l <<<"scale=0;$(bc -l <<<"$brightnessMax * ((($currentBrightness / 960) - $change) / 100)")*100/100")"
