function ShowGrid() {
    rc=0
    printf("    |")
    for (r=0;r<=MR;r++) {
        printf("%3s|",r)
    }
    print ""
    printf("    +")
    for (r=0;r<=MR;r++) {
        printf("---+")
    }
    print ""
    for (u=MU;u>-1;u--) {
        printf("%3s |",u)
        for (r=0;r<=MR;r++) {
            Content="";
            if ((HU==u) && (HR==r)) { Content="H" }
            if ((TU==u) && (TR==r)) { Content=Content "T" }
            if (TOUCH[u "-" r]==1) { Content=Content "#"; rc++}
            if ( Content=="" ) { Content="..." }
            printf("%3s|",Content)
        }
        print ""
        printf("    +")
        for (r=0;r<=MR;r++) {
            printf("---+")
        }
        print ""
    }
    return rc
}

function MoveTail() {

    DidSomething=1

    for (; DidSomething==1 ;) {

        DidSomething=0

        DeltaU=HU-TU
        DeltaR=HR-TR

        if (Direction=="U") {
            if (DeltaU>1)   {
                TU=TU+1; DidSomething=1
                if (DeltaR>0)   { TR=TR+1; DidSomething=1 }
                if (DeltaR<0)   { TR=TR-1; DidSomething=1 }
            }
        }
        if (Direction=="D") {
            if (DeltaU<-1)   {
                TU=TU-1; DidSomething=1
                if (DeltaR>0)   { TR=TR+1; DidSomething=1 }
                if (DeltaR<0)   { TR=TR-1; DidSomething=1 }
            }
        }
        if (Direction=="R") {
            if (DeltaR>1)   {
                TR=TR+1; DidSomething=1
                if (DeltaU>0)   { TU=TU+1; DidSomething=1 }
                if (DeltaU<0)   { TU=TU-1; DidSomething=1 }
            }
        }
        if (Direction=="L") {
            if (DeltaR<-1)   {
                TR=TR-1; DidSomething=1
                if (DeltaU>0)   { TU=TU+1; DidSomething=1 }
                if (DeltaU<0)   { TU=TU-1; DidSomething=1 }
            }
        }
        TOUCH[TU "-" TR]=1
        print "Tail",TU,TR

        # print "MoveTail"
        # ShowGrid()

    }
    
}

BEGIN {
    # Origin is lower left
    # Head
    HU=100
    HR=100
    # Tail
    TU=HU
    TR=HR
    # Max distance from Origin
    MU=HU+10
    MR=HR+10
}

{

    # print "---"
    print NR,$0
    # ShowGrid()

    Direction=$1; 
    Len=$2; 

    TOUCH[TU "-" TR]=1
    print "Head Start",HU,HR
    for (i=1;i<=Len;i++) {
        if (Direction=="U") {
            HU=HU+1
        }
        if (Direction=="D") {
            HU=HU-1
        }
        if (Direction=="R") {
            HR=HR+1
        }
        if (Direction=="L") {
            HR=HR-1
        }
        print "Head During",HU,HR
        MoveTail()
        # print "X",HU,HR;
    }
    print "Head End",HU,HR
    BLAH=""
    if ( (HU<0)||(HR<0) ) {
        BLAH = "Origin Error " HU " " HR
        exit 1;
    }
    TOUCH[TU "-" TR]=1

    if (HR>MR) { MR=HR }
    if (HU>MU) { MU=HU }

    # print "Final"
    # ShowGrid()

}

END {
    foo = ShowGrid()
    print "RESULT: " foo " " BLAH
}