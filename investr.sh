#!/bin/bash

date=$(date +%F-%H)

if [[ $1 == "calc" ]]
then
	echo -n "Calculating... "
	./top.awk < data/$date.txt | sort -r > results/$date.txt
	echo "Done."
	exit
fi

echo -n "Retrieving data... "

for symbol in $(cat nyse_symbols.txt nasdaq_symbols.txt)
do
	./get.sh $symbol &
	sleep 0.1
done > data/$date.txt

echo -ne "Done.\nCalculating... "

./top.awk < data/$date.txt | sort -r > results/$date.txt

echo "Done."
