#!/bin/awk -f
BEGIN { capital = 100000; per = capital/10; }
/EROS/ { print "line contains eros", $2 }
