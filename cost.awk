#!/bin/awk -f
BEGIN { cost = 0; }
{ cost += $4 }
END { print 100000/cost }
