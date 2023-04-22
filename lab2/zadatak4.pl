#!/usr/bin/perl
use Time::Piece;


sub check1h {
    my ($termin, $zakljucano) = ($_[0], $_[1]);
    $termin =~ s/(....-..-.. ..:..).*/\1/;
    $date1=substr($termin,0,10);
    $date2=substr($zakljucano,0,10);
    my $t1 = Time::Piece->strptime($date1, '%Y-%m-%d');
    my $t2 = Time::Piece->strptime($date2, '%Y-%m-%d');

    if($t1 < $t2 || $t1 > $t2){
        return 0;
    }

    $sec1 = (substr($termin,11,13) * 3600) + (substr($termin, 14,16) * 60);
    $sec2 = (substr($zakljucano,11,13) * 3600) + (substr($zakljucano,14,16) * 60) + substr($zakljucano,17,19);

    if($sec1 <= $sec2 && $sec2 <= $sec1 + 3600){
        return 1;
    }

    return 0;


}
$i=0;
while(<>){
    if($i != 0){
        @row = split(";", $_);
    if(! &check1h($row[3], $row[4])){
        $row[3] =~ s/(....-..-.. ..:..).*/\1/;
        print "$row[0] $row[1] $row[2] - PROBLEM: $row[3] --> $row[4]";
    }
    }
    $i += 1;
    
}