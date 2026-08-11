#!/bin/sh

# systray battery icon
# cbatticon -u 5 &

# Volumen
volumeicon &

# install xcape - press super to get menu
xcape -e 'Super_L=Super_L|space'

## Turn off/on System Beep
xset b off

## Enable power management
xfce4-power-manager &


## XFCE4 Settings
#xfsettingsd &
