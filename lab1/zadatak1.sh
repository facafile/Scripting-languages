#!/bin/bash

proba="Ovo je proba"
echo "$proba"

lista_datoteka=(*)
echo "${lista_datoteka[@]}"

proba3="$proba. $proba. $proba. "

a=4
b=3
c=7
d=$(((a + 4) * b % c))

echo "a=$a, b=$b, c=$c, d=$d"

broj_rijeci="$(cat *.txt | wc -w)"

echo ~/*

 
