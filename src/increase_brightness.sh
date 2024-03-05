#!/bin/bash
currentBrightness=$(qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl brightness)
brightnessMax=$(qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl brightnessMax)
change=$1
if [[ $1 == "" ]]; then
    change=$(cat /home/"$(whoami)"/brightness_manager_for_kde_plasma/increment.conf)
fi
if [[ $(((currentBrightness / 960) + change)) -gt 100 ]]; then
    qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness "$brightnessMax"
    exit 0
fi
math="($brightnessMax * (( ($currentBrightness / 960) + $change) / 100) *100/100)"
qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness "$(bc -l <<<"scale=0;$(bc -l <<<"$math")/1")"
