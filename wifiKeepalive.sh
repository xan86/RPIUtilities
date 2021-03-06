#!/bin/bash
# sudo crontab -e
# */10 * * * * /home/pi/RPIUtilities/wifiKeepalive.sh >/dev/null 2>&1
# or directly try
# sudo ifconfig wlan0 down
# sudo bash wifiKeepalive.sh

#SERVER=8.8.8.8
#Let's do local ping and do not disturbe google
SERVER=$(/sbin/ip route | awk '/default/ { print $3 }')
echo "Server to ping:" $SERVER
res=$(ping -c1 $SERVER | grep 64)
echo "Result:" $res

if [ -z "$res" ]
then
    # Restart the wireless interface
    echo "ping failed, restarting wlan0"
    /sbin/ifconfig wlan0 down
    sleep 5
    /sbin/ifconfig wlan0 up
else
    echo "wifi ok"
fi
