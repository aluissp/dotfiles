#!/bin/sh

# systray battery icon
# cbatticon -u 5 &
# systray volume
# volumeicon &

# install xcape - press super to get menu
xcape -e 'Super_L=Super_L|space'

## Turn off/on System Beep
xset b off

## Enable power management
xfce4-power-manager &

# Clipboard Manager
(xfce4-clipman) &

## XFCE4 Settings
#xfsettingsd &
