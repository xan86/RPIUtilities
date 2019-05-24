#usage python thisscript.py value(0.8-10.9)
import sys
import time
import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setup(4,GPIO.OUT)
pwm=GPIO.PWM(4,50)
pwm.start(float(sys.argv[1]))
time.sleep(.1)
pwm.stop()
GPIO.cleanup()
exit()
pwm.ChangeDutyCycle(10)

