#!/bin/bash
for i in $(ls /var/www/html/media/*.h264 | head -5); do
	MP4Box -fps 20 -add $i ${i: : -5};
	rm $i;
done
