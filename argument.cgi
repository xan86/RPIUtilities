#!/bin/bash
#usage:
# html: domain:port/cgi-bin/argument.cgi?argument
# bash: ./argument.cgi argument
echo -e "Content-type: text/html\n\n"
echo "<h1>Hello World</h1>"
echo '<h1> $1 : ' $1 '</h1>'
