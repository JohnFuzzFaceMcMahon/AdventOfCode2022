BEGIN {

}

{
    gsub("\r","",$0)
    if ($1=="Monkey")   {
        Work=$2;
        gsub(":","",Work);
        MonkeyNumber=Work;
        Items[MonkeyNumber]="EMPTY"
        Oper[MonkeyNumber]="EMPTY"
        Div[MonkeyNumber]="EMPTY"
    }
    if ($1=="Starting") { 
        Items[MonkeyNumber]=""
        for (i=3;i<=NF;i++) {
            Work=$i
            gsub(",","",Work)
            Items[MonkeyNumber] = Items[MonkeyNumber] Work ":"
        }
    }
    if ($1=="Operation:") {
        Oper[MonkeyNumber]=$5 ":" $6 ":"
    }
    if ($1=="Test:") {
        Div[MonkeyNumber]=$4
    }
    if ($2=="true:") {
        True[MonkeyNumber]=$6
    }
    if ($2=="false:") {
        False[MonkeyNumber]=$6
    }
    # printf("'%s' ----- '%s' '%s' '%s' '%s' '%s' '%s'\n",$0,MonkeyNumber,Items[MonkeyNumber],Oper[MonkeyNumber],Div[MonkeyNumber],True[MonkeyNumber],False[MonkeyNumber])
}

END {
    for (Round=1;Round<=20;Round++) {
        for (i=0;i<=MonkeyNumber;i++) {
            print "Monkey " i ":"
            # print Items[i]
            j=split(Items[i],ARRAY1,":");
            # Monkey is going to toss them all
            Items[i]="";
            for (k=1;k<=(j-1);k++) {
                print "  Monkey inspects an item with a worry level of " ARRAY1[k] "."
                Inspect[i]++
                WorryLevel=ARRAY1[k];
                # Process the Operation
                split(Oper[i],ARRAY2,":")
                # print ARRAY2[1],ARRAY2[2]
                WorkNumber=ARRAY2[2]
                if (WorkNumber=="old") WorkNumber=WorryLevel
                if ( ARRAY2[1]=="+") {
                    WorryLevel=WorryLevel + WorkNumber
                    print "    Worry level increases by " WorkNumber " to " WorryLevel "."
                }
                if ( ARRAY2[1]=="*") {
                    WorryLevel=WorryLevel * WorkNumber
                    print "    Worry level is multiplied by " WorkNumber " to " WorryLevel "."
                }
                WorryLevel=int(WorryLevel/3)
                print "    Monkey gets bored with item. Worry level is divided by 3 to " WorryLevel "."
                if ( WorryLevel%Div[i]==0 ) {
                    Items[ True[i] ]=Items[ True[i] ] WorryLevel ":"
                    print "    Current worry level is divisible by " Div[i] "."
                    print "    Item with worry level " WorryLevel " is thrown to monkey " True[i] "."
                } else {
                    Items[ False[i] ]=Items[ False[i] ] WorryLevel ":"
                    print "    Current worry level is not divisible by " Div[i] "."
                    print "    Item with worry level " WorryLevel " is thrown to monkey " False[i] "."
                }
            }
        }
        print "After round " Round ", the monkeys are holding items with these worry levels:"
        for (i=0;i<=MonkeyNumber;i++) {
            print "Monkey " i ": " Items[i]
        }
        print "End Round"   
    }
    for (i=0;i<=MonkeyNumber;i++) {
            print "Monkey " i " inspected items " Inspect[i] " times."
    }
    asort(Inspect,TopMonkeys)
    print "Result: " TopMonkeys[MonkeyNumber]*TopMonkeys[MonkeyNumber+1]
}