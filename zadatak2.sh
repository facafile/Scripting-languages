#!/bin/bash

grep 'banana|jabuka|lubenica|dinja|jagoda' -i -E namirnice.txt 

grep 'banana|jabuka|lubenica|dinja|jagoda' -i -E -v namirnice.txt 

grep -E -r '[A-Z]{3}[0-9]{6}'  ~/projekti/

find . -type f -mtime +7 -mtime -14 -ls

for i in {1..15}; do echo -n "$i "; done

kraj=15

for i in $(seq 1 $kraj); do echo -n "$i "; done
echo

for i in {1..$kraj}; do echo -n "$i "; done
echo
