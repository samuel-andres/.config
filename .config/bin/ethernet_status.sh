#!/bin/sh
 
STATEX=$(/usr/bin/nmcli d | grep -m1 eth0 |awk '{print $3}')
 
if [ "$STATEX" = "connected" ]; then
    echo "%{F#2495e7} %{F#ffffff}$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')%{u-}"
else
    echo "%{F#2495e7}%{u-} Disconnected"
fi
