#!/usr/bin/perl

print "ucitaj polje\n";
chomp($a = <STDIN>);

@b = split(" ", $a);
$c=0;
for(0..$#b){
    $c += $b[$_];
}
$c /= $#b+1;
print "aritmeticka sredina je $c"
