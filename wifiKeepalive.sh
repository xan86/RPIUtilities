#!/bin/bash
# chmod +x /path/wifiKeepalive.sh
# sudo nano /etc/crontab
# */5 * * * * bash /path/wifiKeepalive.sh
# force stop 
# ifdown --force wlan0
# and try


# The IP for the server you wish to ping (the gateway ip is enough to test wifi)
SERVER=$(/sbin/ip route | awk '/default/ { print $3 }')

# Only send two pings, sending output to /dev/null
ping -c2 ${SERVER} > /dev/null

# If the return code from ping ($?) is not 0 (meaning there was an error)
if [ $? != 0 ]
then
    # Restart the wireless interface
    ifdown --force wlan0
    ifup wlan0
fi
