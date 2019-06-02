#!/bin/bash
#RPI_Cam_Web_Interface MP4Box manual script
for i in $(ls /var/www/html/media/*.h264 | head -5); do
	MP4Box -fps 20 -add $i ${i: : -5};
	rm $i;

done
