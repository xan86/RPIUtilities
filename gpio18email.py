#when pin 18 go gnd send mail
#run at boot with /etc/rc.local
#CONFIG
#enable "Allow less secure apps in gmail"
#sudo apt-get install ssmtp
#sudo nano /etc/ssmtp/ssmtp.conf
#file content
#root=your_account@gmail.com
#mailhub=smtp.gmail.com:587
#FromLineOverride=YES
#AuthUser=your_account@gmail.com
#AuthPass=your_password
#UseSTARTTLS=YES
#UseTLS=YES

import RPi.GPIO as GPIO
import time
import subprocess

GPIO.setmode(GPIO.BCM)

GPIO.setup(18, GPIO.IN, pull_up_down=GPIO.PUD_UP)

def sendMail(mailAddr, date):
	mailCommand = 'printf "To: ' + mailAddr + '\nFrom: RPI\nSubject: Mail\n\nMail Text\n' + date + '\n" | ssmtp -t'
	ris = 1
	counter = 0
	while ris:
		global ris
		ris = subprocess.call(mailCommand, shell=True)
		#returns 0 if OK and 1 if not send
		if ris:
			print("Send error")
		else:
			print("Mail sent")
		# Excaper
		global counter
		counter = counter + 1
		if counter >= 20:
			ris = 0
	

firstTime = 1 #1 can send - 0 NO
while True:
	input_state = GPIO.input(18)
	if input_state == False:
		if firstTime:
			global firstTime
			firstTime = 0 
			print('pin18 grounded') 
			dateTime = time.strftime("Date: %d-%m-%Y Time: %H:%M")
			#sendMail("yourmail@gmail.com", dateTime)
	else:
		global firstTime
		firstTime = 1
	time.sleep(0.2)
