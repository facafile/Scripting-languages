#!/usr/bin/perl
print "input a string\n";
chomp($a = <STDIN>);
print "input number of repetitions\n";
chomp($b = <STDIN>);
for(1..$b){
print "$a\n";
}
