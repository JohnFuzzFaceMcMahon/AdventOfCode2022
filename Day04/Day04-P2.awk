{

    # print "---"
    # print "'" $0 "'"

    split($0,Elf,"[,-]")

    Flag="NO"

    for (i=Elf[1];i<=Elf[2];i++) {
        if (i==Elf[3]) Flag="YES"
        if (i==Elf[4]) Flag="YES"
    }
    for (i=Elf[3];i<=Elf[4];i++) {
        if (i==Elf[1]) Flag="YES"
        if (i==Elf[2]) Flag="YES"
    }

    if (Flag=="YES") {
        Counter++
    }    
}

END {
    print "Result",Counter
}