#!/bin/bash
intern=eDP-1-1
hdmi=HDMI-0
usbc0=DP-0
usbc1=DP-1

if xrandr | grep "$usbc0 connected"; then
    exec /usr/share/sddm/scripts/ultrawide0.sh
elif xrandr | grep "$usbc1 connected"; then 
    exec /usr/share/sddm/scripts/ultrawide1.sh
elif xrandr | grep "$hdmi connected"; then 
    exec /usr/share/sddm/scripts/hdmi.sh
else
    exec /usr/share/sddm/scripts/single.sh
fi


