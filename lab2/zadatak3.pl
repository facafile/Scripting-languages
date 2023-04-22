#!/usr/bin/perl

use Time::Piece;

$date="0000-00-00";
$x="00";
$y=0;
while(<>){
    chomp;
    $temp = $_;
    $temp =~ s/.*\[(..\/.*\/.{4}).*\].*/\1/g;
    $temp2 = Time::Piece->strptime($temp, '%d/%b/%Y');
    $formated_date = $temp2->strftime('%Y-%m-%d');
    
    s/.*\[.*:(..):..:.*\].*/\1/g;

    if($_ eq $x){
        $y+=1;
    }
    else {
        print "$x : $y\n";
        $x=$_;
        $y=1;
    }

    if($date ne $formated_date){
        print "\n$formated_date\n";
        print "sat : broj pristupa\n";
        print "------------------------------\n";
        $date = $formated_date;
    }

}

print "$x : $y\n";