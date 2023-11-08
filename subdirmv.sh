#!/bin/bash

dir="1"

for file in "$dir"/*;do
	if [[ -f "$file" ]]; then
		date=$(<"$file")

		destination_dir=$(date -d "$date" +"%Y/%m/%d")

		mkdir -p "$destination_dir"

		mv "$file" "$destination_dir/"
	fi
done
