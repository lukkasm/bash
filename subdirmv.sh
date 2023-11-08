#!/bin/bash

shopt -s dotglob

dir=$1

for file in "$dir"/*{0001..1000}.txt; do
	if [[ -f "$file" ]]; then
		date=$(cat "$file")
		year=$(echo $date | cut -d'/' -f3)
    		month=$(echo $date | cut -d'/' -f2)
    		day=$(echo $date | cut -d'/' -f1)

    		dest_dir="$dir/$year/$month/$day"
    
    		mkdir -p $dest_dir
   		mv $file $dest_dir/
	fi
done

shopt -u dotglob
