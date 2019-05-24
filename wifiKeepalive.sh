#!/bin/bash
# chmod +x /path/wifiKeepalive.sh
# sudo nano /etc/crontab
# */5 * * * * bash /path/wifiKeepalive.sh
# or directly
# sudo bash wifiKeepalive.sh
# force stop 
# sudo ifconfig wlan0 down
# and try

#SERVER=$(/sbin/ip route | awk '/default/ { print $3 }')
SERVER=8.8.8.8
res=$(ping -c1 192.168.2.100 | grep 64)

if [ -z "$res" ]
then
    # Restart the wireless interface
    echo "ping failed, restarting wlan0"
    ifconfig wlan0 down
    ifconfig wlan0 up
else
    echo "wifi ok"
fi
