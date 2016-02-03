#!/bin/bash

#fmt='{ print "Name:\t", $1, "\nPrice:\t", $2, "$\nChange:\t", $5, "%" }'
if [[ $2 == "price" ]]
then
	fmt='{ print $2 }'
elif [[ $2 == "change" ]]
then
	fmt='{ print $5 }'
else
	fmt='{ print $1, $2, $5 }'
fi

curl -s "http://download.finance.yahoo.com/d/quotes.csv?f=sl1d1t1c1ohgv&e=.csv&s=$1" \
	| awk -F',' "$fmt"
