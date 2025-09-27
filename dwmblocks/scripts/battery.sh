#!/bin/bash
. ~/dwmblocks/scripts/onedark.sh
BAT=$(upower -i `upower -e | grep 'BAT'` | grep 'percentage' | cut -d':' -f2 | tr -d '%,[:blank:]')
AC=$(upower -i `upower -e | grep 'BAT'` | grep 'state' | cut -d':' -f2 | tr -d '[:blank:]')

if [[ "$AC" == "charging" ]]; then
    printf "$BAT%%"
elif [[ "$AC" == "fully-charged" ]]; then
    printf "Full"
else
    if [[ ("$BAT" -ge "0") && ("$BAT" -le "20") ]]; then
        printf " $BAT%%"
    elif [[ ("$BAT" -ge "20") && ("$BAT" -le "40") ]]; then
        printf " $BAT%%"
    elif [[ ("$BAT" -ge "40") && ("$BAT" -le "60") ]]; then
        printf " $BAT%%"
    elif [[ ("$BAT" -ge "60") && ("$BAT" -le "80") ]]; then
        printf " $BAT%%"
    elif [[ ("$BAT" -ge "80") && ("$BAT" -le "100") ]]; then
        printf " $BAT%%"
    fi
fi
