#!/bin/bash

while true; do
	temp=$(/opt/vc/bin/vcgencmd measure_temp | cut -d'=' -f 2)
	cpuvolt=$(vcgencmd measure_volts core | cut -d'=' -f 2)
	ramvolt=$(vcgencmd measure_volts sdram_c | cut -d'=' -f 2)
	echo CPU $temp $cpuvolt RAM $ramvolt
	sleep 1
done
