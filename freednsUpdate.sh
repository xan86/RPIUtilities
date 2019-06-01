#!/bin/sh
#FreeDNS updater script
#sudo apt-get update
#sudo apt-get install dnsutils
#sudo crontab -e 
#and add
#*/10 * * * * /cartelle/script.sh

UPDATEURL="http://freedns.afraid.org/dynamic/update.php?_YOURAPIKEYHERE_"
DOMAIN="_YOURDOMAINHERE_"
echo "DNS check"
registered=$(nslookup $DOMAIN|tail -n2|grep A|sed s/[^0-9.]//g)
echo "DNS IP: $registered"
current=$(wget -q -O - http://checkip.dyndns.org|sed s/[^0-9.]//g)
echo "MY IP: $current"

[ "$current" != "$registered" ] && {                           
        wget -q -O /dev/null $UPDATEURL 
        echo "DNS updated on:"; date
}
