#!/bin/bash

echo "folder koji pretrazujemo rekurzivno $1"
echo "Uvijet koji datoteke koje pretazujemo moraju zadovoljiti $2"

datoteke=$(find $1 -name "$2" -type f )
counter=0

for file in $datoteke
do
	var=$(wc -l $file| cut -d' ' -f1)

	((counter=counter+var))
done

echo "broj redaka u datotekama sa navedenim filterom je $counter"
