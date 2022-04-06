#!/bin/sh
 
STATEX=$(/usr/bin/nmcli d | grep -m1 wlan0 |awk '{print $3}')
 
if [ "$STATEX" = "connected" ]; then
    echo "%{F#1bbf3e} %{F#ffffff}$(/usr/bin/nmcli d |grep -m 1 wlan0 | awk '{print $4" "$5" "$6$7$8$9}')%{u-}"
else
    echo "%{F#1bbf3e}%{u-} Disconnected"
fi
