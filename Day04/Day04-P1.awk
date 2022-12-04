{

    # print "---"
    # print "'" $0 "'"

    split($0,Elf,"[,-]")
    asort(Elf,Ass)

    Flag="NO"
    if ( (Elf[1]==Ass[1]) && (Elf[2]==Ass[4]) ) {
        Flag="YES"
    }
    if ( (Elf[3]==Ass[1]) && (Elf[4]==Ass[4]) ) {
        Flag="YES"
    }

    if (Flag=="YES") {
        Counter++
        # print $0;
    }    
}

END {
    print "Result",Counter
}