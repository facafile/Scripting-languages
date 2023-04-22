#!/bin/bash

first_dir=$1
second_dir=$2

if [ $# -ne 2 ] || [ ! -d "$first_dir" ] || [ ! -d "$second_dir" ]; then
  echo "Ne postoji direktorij koji je naveden ili nisu dana dva argumenta"
  exit 1
fi



for file in $(find $first_dir -type f|sort)
do
	file2=$(find $second_dir -type f -name "$(basename $file)")
	if [ -f "$file2" ]
	then
		if [ $file -nt $file2 ]
		then
			echo "$file --> $second_dir"
		fi
	else
		echo "$file --> $second_dir" 
	fi
done

for file in $(find $second_dir -type f|sort)
do
	file2=$(find $first_dir -type f -name "$(basename $file)")
	if [ -f "$file2" ]
	then
		if [ $file -nt $file2 ]
		then
			echo "$file --> $first_dir"
		fi
	else
		echo "$file --> $first_dir"
	fi
done
