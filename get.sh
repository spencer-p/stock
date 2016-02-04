#!/bin/bash

if [[ $2 == "price" ]]; then
	fmt='{ print $2 }'
elif [[ $2 == "change" ]]; then
	fmt='{ print $5/$6 }'
elif [[ $2 == "raw" ]]; then
	fmt='{ print $0 }'
else
	fmt='{ print $1, $2, $5/$6, $9 }'
fi

curl -s "http://download.finance.yahoo.com/d/quotes.csv?f=sl1d1t1c1ohgv&e=.csv&s=$1" \
	| awk -F',' "!/N\/A/$fmt"
