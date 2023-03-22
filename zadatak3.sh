#!/bin/bash

folder=$1

if [ $# -ne 1 ] || [ ! -d "$1" ]; then
  echo "Ne postoji direktorij ili nije dan argument"
  exit 1
fi

for file in $(find $folder -regextype posix-egrep -regex '.*[0-9]{2}-02-[0-9]{4}*.*' -type f )
do
	echo $file | grep -Eo '[0-9]{2}-[0-9]{2}-[0-9]{4}'
	echo "----------------------------------------"
	sed -z '$ s/\n$//' $file|cut -d ' ' -f 6-8  |sort|uniq -c|sort -n -r
	
done
