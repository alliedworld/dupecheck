#!/bin/sh -l

echo "Looking for duplicate files..."
dupeFiles=$(find . | tr '[A-Z]' '[a-z]' | sort | uniq -c | grep -v " 1 ")
dupeCount=$(find . | tr '[A-Z]' '[a-z]' | sort | uniq -c | grep -v " 1 " | wc -l)

if [ $dupeCount -gt 0 ]; then
	echo ERROR: Duplicates detected:
	echo $dupeFiles | tr " " "\n"
	exit 1 # terminate and indicate error
fi
