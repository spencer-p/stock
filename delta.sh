#!/bin/bash

capital=$(awk "BEGIN { print $1-(($#-3)*10) }")
beg=$2
end=$3

rev=0

echo -e 'Stock\tChange\tShares'
for i in ${@:4}
do
	initial=$(grep -m 1 \"$i\" $beg | awk '{print $2}')
	maxshares=$(grep -m 1 \"$i\" $beg | awk '{print $9*0.01}')
	final=$(grep -m 1 \"$i\" $end | awk '{print $2}')
	change=$(echo $final - $initial | bc)
	shares=$(awk "BEGIN { per = $capital/($#-3); shares = int(per/$initial); print (shares>$maxshares)?$maxshares:shares }")
	rev=$(awk "BEGIN { profit = $shares*$change; print profit+$rev }")
	echo -e $i\\t$change\\t$shares
done

echo Return: $(awk "BEGIN { print $capital+$rev }")
