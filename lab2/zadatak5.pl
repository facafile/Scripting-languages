#!/usr/bin/perl
$i=0;
@list = ();
@people = ();
while(<>){
    if($_ ne "\n" && substr($_,0,1) ne "#"){
        if($i == 0){
        @list = split(";", $_);
    }
        else{
        @human = split(";",$_);
        $sum = 0;
        for $a (3..$#list+3){
            $sum += $human[$a] * $list[$a - 3];
        }
        push(@people,"$sum $human[0] $human[1] $human[2]");
        }
        $i += 1;
    }
    
    
}

@people = sort {$b <=> $a} @people;
$i=1;
print "Lista po rangu:\n";
print "------------------\n";
foreach(@people){
    /([0-9.]*) (.*)/;
    printf "%d. %s : %4.2f\n",$i, $2, $1;
    $i += 1;
}