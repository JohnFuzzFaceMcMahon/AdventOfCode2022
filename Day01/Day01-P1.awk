# john@mcmahon.engineering
# https://github.com/JohnFuzzFaceMcMahon/AdventOfCode2022
# Day01-P1.awk
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
    MaxValue=0
    MaxElf=0
    for (x in Calories) {
        if ( Calories[x]>MaxValue) {
            MaxValue=Calories[x]
            MaxElf=x
            # print "+++ " x
        } else {
            # print "--- " x
        }
    }
    print "Elf " MaxElf " has " MaxValue " calories"
}
