#!/bin/bash
intern=eDP-1-1
extern=HDMI-0

if xrandr | grep "$extern disconnected"; then
    exec /etc/lightdm/single.sh
else
    exec /etc/lightdm/left.sh
fi
