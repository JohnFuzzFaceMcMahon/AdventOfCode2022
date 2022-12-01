BEGIN {
    ElfNumber=1
}

{
    if ($0=="") {
        ElfNumber++
    } else {
        Calories[ElfNumber]=Calories[ElfNumber]+$0
        # print "*** Elf " ElfNumber " has " Calories[ElfNumber] " calories"
    }
}

END {
    # for (i in Calories) {
    #    print "--- " Calories[i]
    # }
    Counter=asort(Calories)
    Total=0
    for (i=Counter-2;i<=Counter;i++) {
        Total=Calories[i]+Total
    }
    print "Top three elves are carrying " Total " calories"
}
