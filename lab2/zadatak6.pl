#!/usr/bin/perl

use open ':locale';
use locale;
use utf8;

sub getWords{
    my $row;
    ($row) = (@_);
    $row =~ tr/a-zšđčćž/ /cs;
    @xx =split / /, $row;
}


$len = $ARGV[-1];
$#ARGV -=1;

while(<>){
    $_ = lc($_);
    @xx = &getWords($_);
    foreach $x (@xx){
        if(length($x) >= $len){
            if($linked{substr($x,0,$len)}){
                $linked{substr($x,0,$len)} += 1;
            }
            else {
                $linked{substr($x,0,$len)} = 1;
            }
        }
    }
}

@keys = keys %linked;
@keys = sort {lc($a) cmp lc($b)} @keys;
foreach $el (@keys){
    print "$el : $linked{$el}\n";
}