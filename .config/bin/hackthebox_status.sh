#!/bin/sh
 
STATEX=$(/usr/bin/nmcli d | grep -m1 wlan0 |awk '{print $3}')
 
if [ "$STATEX" = "connected" ]; then
    echo "%{F#1bbf3e} %{F#ffffff}$(/usr/sbin/ifconfig wlan0 | grep "inet " | awk '{print $2}')%{u-}"
else
    echo "%{F#1bbf3e}%{u-} Disconnected"
fi
