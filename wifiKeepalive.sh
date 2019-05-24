#!/bin/bash
# chmod +x /path/wifiKeepalive.sh
# sudo nano /etc/crontab
# */5 * * * * /home/pi/RPIUtilities/wifiKeepalive.sh
# or directly
# sudo bash wifiKeepalive.sh
# force stop 
# sudo ifconfig wlan0 down
# and try

#SERVER=8.8.8.8
#Let's do local ping and do not disturbe google
SERVER=$(/sbin/ip route | awk '/default/ { print $3 }')
echo "Server to ping:" $SERVER
res=$(ping -c1 192.168.2.100 | grep 64)
echo "Result:" $res

if [ -z "$res" ]
then
    # Restart the wireless interface
    echo "ping failed, restarting wlan0"
    ifconfig wlan0 down
    ifconfig wlan0 up
else
    echo "wifi ok"
fi
