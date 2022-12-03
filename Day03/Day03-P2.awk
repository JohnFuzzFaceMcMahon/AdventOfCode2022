BEGIN {
    Items="abcdefghijklmnopqrstuvwxyzABCDEFGHUJKLMNOPQRSTUVWXYZ"
    TotalPriority=0
}

{
    Rucksack[NR]=$0
}

END {
    for (i=1;i<=NR;i=i+3) {
        for (j=1;j<=52;j++) {
            Char=substr(Items,j,1)
            if (index(Rucksack[i],Char)>0) {
                if (index(Rucksack[i+1],Char)>0) {
                    if (index(Rucksack[i+2],Char)>0) {
                        print "Group " i " common element is " Char " (" j ")"
                        TotalPriority=TotalPriority+j
                    }
                }
            }
        }
    }
    print "Total Priority: " TotalPriority
}