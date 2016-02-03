#!/bin/bash

beg=$1
end=$2

for i in ${@:3}; do
	initial=$(grep $i $beg | awk '{print $2}')
	final=$(grep $i $end | awk '{print $2}')
	echo Started at $initial, ended at $final, change of $($final-$initial)
done
