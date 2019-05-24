#!/bin/bash
# chmod +x /path/wifiKeepalive.sh
# sudo nano /etc/crontab
# */5 * * * * bash /path/wifiKeepalive.sh
# or directly
# sudo bash wifiKeepalive.sh
# force stop 
# sudo ifconfig wlan0 down
# and try


# The IP for the server you wish to ping (the gateway ip is enough to test wifi)
SERVER=$(/sbin/ip route | awk '/default/ { print $3 }')

# Only send two pings, sending output to /dev/null
ping -c2 ${SERVER} > /dev/null
echo ping $SERVER

# If the return code from ping ($?) is not 0 (meaning there was an error)
if [ $? != 0 && $SERVER != 0 ]
then
    # Restart the wireless interface
    echo "print failed restarting wlan0"
    ifconfig wlan0 down
    ifconfig wlan0 up
fi
