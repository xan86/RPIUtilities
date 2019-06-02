#!/bin/sh

# dyndns updater script needs dnsutils and miniupnpc
#sudo apt-get update
#sudo apt-get install dnsutils miniupnpc
# to run periodically run
#crontab -e
# and add
#* * * * * /folder/dyndnsUpdate.sh

UPDATEURL="http://user:password@update.dyndns.it/nic/update?hostname=domain.dyndns.com"
DOMAIN="domain.dyndns.com"
echo "DNS check" 

# interet data usage
#registered=$(nslookup $DOMAIN|tail -n2|grep A|sed s/[^0-9.]//g)
#current=$(wget -q -O - http://checkip.dyndns.org|sed s/[^0-9.]//g)

# no internet data usage
registered=$(cat /home/pi/externalip.txt)
current=$(upnpc -l | grep ExternalIP | cut -d'=' -f2 | cut -d' ' -f2)

echo "DNS IP: $registered"
echo "ROUTER IP: $current"

# $current = "" (when modem not connected)
[ "$current" != "" ] && [ "$current" != "$registered" ] && {
	wget -q -O /dev/null $UPDATEURL
	> /home/pi/externalip.txt
	echo $current >> /home/pi/externalip.txt
	echo "DNS updated on:"; date
}
