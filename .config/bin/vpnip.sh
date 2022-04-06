#!/bin/sh
 
STATEX=$(/usr/bin/nmcli d | grep -m1 tun0 |awk '{print $3}')
 
if [ "$STATEX" = "connected" ]; then
    echo "%{F#1bbf3e}旅 %{F#ffffff}$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
else
    echo "%{F#1bbf3e}旅%{u-} Disconnected"
fi
