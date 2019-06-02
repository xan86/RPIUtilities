#!/bin/bash

HTTPE=80
HTTPEB=80
FTPE=21
FTP=21
SSHE=22
SSH=22
upnpc -d $HTTPE TCP $HTTPEB TCP $FTPE TCP $FTP TCP $SSHE TCP $SSH TCP >/dev/null 2>&1
echo "port reset done"
