#!/bin/bash

if [ $# -ne 1 ] || [ ! -d "$1" ]; then
  echo "Ne postoji direktorij ili nije dan argument"
  exit 1
fi

path=$1
files=$(find "$1" -name '*.jpg'|sort -n)


counter=0
date="000000"
for el in $files 
do
	x=$(echo $el |grep -E -o '*[0-9]{8}_[0-9]{4}.jpg'|cut -c 1-6)
	
	if [ $x -gt $date ] 
	then
		echo "Ukupan broj slika je $counter"
		echo "$(echo $x|cut -c 5-6)-$(echo $x |cut -c 1-4)"
		counter=1
		date=$x
	elif [ $x -eq $date ] 
	then
		((counter=counter+1))
	fi
	
	echo "${counter}. $el"
done

echo "Ukupan broj slika je $counter"
