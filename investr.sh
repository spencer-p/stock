#!/bin/bash

if [[ ! -d "results" ]]; then
	mkdir results
fi
if [[ ! -d "data"  ]]; then
	mkdir data
fi

date=$(date +%F-%H)

calc() {
	echo -n "Calculating... "
	./top.awk < data/$date.txt | sort -r > results/$date.txt
	echo "Done."
	head -10 results/$date.txt
}

get() {
	echo -n "Retrieving data... "
	for symbol in $(cat nyse_symbols.txt nasdaq_symbols.txt)
	do
		./get.sh $symbol &
		sleep 0.1
	done > data/$date.txt
	echo "Done."
}

if [[ $1 == "calc" ]]; then
	if [[ $# > 1 ]]; then
		date=$2
	fi
	calc
	exit
fi

get
calc
