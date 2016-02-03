#!/bin/awk -f
BEGIN { minPrice = 2; maxPrice = 20; minChange = 2/10; }
($2 != "N/A" && $3 != "N/A" && $2 >= minPrice && $2 <= maxPrice && $3 >= minChange) {
	print $3/$2, "->", $1, $2, $3;
}
