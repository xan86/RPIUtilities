#!/usr/bin/python
# usage: 
# 	html: pyPing.py?ip=<ip>
#	bash: python pyPing.py ip=<ip>

import cgi 
import os

arguments = cgi.FieldStorage()
print "Content-type: text/html\n\n"

response = os.system("ping -c1 -w1 " + arguments['ip'].value + " > /dev/null")
if response == 0:
  #print arguments['ip'].value, 'is up!' 
  print "1"
else:
  #print arguments['ip'].value, 'is down!'
  print "0"