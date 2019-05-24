#!/bin/bash
#sudo apt-get update
#sudo apt-get install dnsutils miniupnpc

ip=$(upnpc -l | grep "Local LAN ip address" | cut -d: -f2)
echo "IGD forwarding ports to: " $ip
HTTPE=8080
HTTP=80
FTPE=21
FTP=21
SSHE=22
SSH=22
#$(upnpc -d $HTTPE TCP $HTTP TCP $FTP TCP $SSH TCP >/dev/null 2>&1)
$(upnpc -a $ip $HTTP $HTTPE TCP >/dev/null 2>&1)
#$(upnpc -a $ip $FTP $FTPE TCP >/dev/null 2>&1)
#$(upnpc -a $ip $SSH $SSHE TCP >/dev/null 2>&1)
#$(upnpc -a $ip $HTTP $HTTPE TCP >/dev/null 2>&1)
#for huawei5330
#upnpc -u http://192.168.8.1:54008/rootDesc.xml -r 80 TCP
