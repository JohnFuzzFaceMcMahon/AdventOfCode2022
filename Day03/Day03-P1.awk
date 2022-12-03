BEGIN {
    Items="abcdefghijklmnopqrstuvwxyzABCDEFGHUJKLMNOPQRSTUVWXYZ"
    TotalPriority=0
}

{
    RLength=length($0)
    Rucksack[NR "-1"]=substr($0,1,RLength/2)
    Rucksack[NR "-2"]=substr($0,RLength/2+1)
    for (i=1;i<=52;i++) {
        Char=substr(Items,i,1)
        if ( (index(Rucksack[NR "-1"],Char)>0) && (index(Rucksack[NR "-2"],Char)>0) ) {
            print "Duplicate " Char " in " NR
            TotalPriority=TotalPriority+i
        }
    }
}

END {
    print "Total Priority: " TotalPriority
}