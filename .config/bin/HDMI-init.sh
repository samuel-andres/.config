#!/bin/sh
 
STATEY=$(/usr/bin/xrandr --current | grep ' connected' |grep HDMI-1 |awk '{print $2}')
 
if [ "$STATEY" = "connected" ]; then
    xrandr --output HDMI-1 --same-as LVDS-1
fi
