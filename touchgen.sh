#!/bin/bash

shopt -s dotglob

for i in {0001..1000}; do
	day=$((RANDOM % 31 + 1))
	month=$((RANDOM % 12 + 1))
	year=$((RANDOM % 10 + 2010))

	echo "$day/$month/$year" > "./foo$i.txt"
done

shopt -u dotglob
