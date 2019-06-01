#Start with rc.local remember & because of the while true

import RPi.GPIO as GPIO
import time
import subprocess

GPIO.setmode(GPIO.BCM)
GPIO.setup(19, GPIO.IN, pull_up_down=GPIO.PUD_UP)
		
while True:
	time.sleep(0.2)
    input_state = GPIO.input(19)
    if input_state == False:
        print('Poweroff Pressed')
        subprocess.call('poweroff', shell=True)