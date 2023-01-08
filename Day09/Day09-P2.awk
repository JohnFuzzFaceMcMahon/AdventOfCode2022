function ShowGrid() {
    rc=0
    printf("    |")
    for (r=0;r<=MR;r++) {
        printf("%11.11s|",r)
    }
    print ""
    printf("    +")
    for (r=0;r<=MR;r++) {
        printf("-----------+")
    }
    print ""
    for (u=MU;u>-1;u--) {
        printf("%3s |",u)
        for (r=0;r<=MR;r++) {
            Content="";
            if ((HU==u) && (HR==r)) { Content="H" }
            for (s=1;s<=9;s++) {
                if ((TU[s]==u) && (TR[s]==r)) { Content=Content s }
            }
            if (TOUCH[u "-" r]==1) { Content=Content "#"; rc++}
            Content=Content "............" 
            printf("%11.11s|",Content)
        }
        print ""
        printf("    +")
        for (r=0;r<=MR;r++) {
            printf("-----------+")
        }
        print ""
    }
    return rc
}

function MoveTail(TN) {

    DidSomething=1

    for (; DidSomething==1 ;) {

        DidSomething=0

        if (TN==1) {
            DeltaU=HU-TU[TN]
            DeltaR=HR-TR[TN]
        } else {
            DeltaU=TU[TN-1]-TU[TN]
            DeltaR=TR[TN-1]-TR[TN]       
        }

        # DeltaU=HU-TU
        # DeltaR=HR-TR

        if (Direction=="U") {
            if (DeltaU>1)   {
                TU[TN]=TU[TN]+1; DidSomething=1
                if (DeltaR>0)   { TR[TN]=TR[TN]+1; DidSomething=1 }
                if (DeltaR<0)   { TR[TN]=TR[TN]-1; DidSomething=1 }
            }
        }
        if (Direction=="D") {
            if (DeltaU<-1)   {
                TU[TN]=TU[TN]U-1; DidSomething=1
                if (DeltaR>0)   { TR[TN]=TR[TN]+1; DidSomething=1 }
                if (DeltaR<0)   { TR[TN]=TR[TN]-1; DidSomething=1 }
            }
        }
        if (Direction=="R") {
            if (DeltaR>1)   {
                TR[TN]=TR[TN]+1; DidSomething=1
                if (DeltaU>0)   { TU[TN]=TU[TN]+1; DidSomething=1 }
                if (DeltaU<0)   { TU[TN]=TU[TN]-1; DidSomething=1 }
            }
        }
        if (Direction=="L") {
            if (DeltaR<-1)   {
                TR[TN]=TR[TN]-1; DidSomething=1
                if (DeltaU>0)   { TU[TN]=TU[TN]+1; DidSomething=1 }
                if (DeltaU<0)   { TU[TN]=TU[TN]-1; DidSomething=1 }
            }
        }
        TOUCH[ TU[TN] "-" TR[TN] ]=1
        print "Tail",TN,TU[TN],TR[TN]

        # print "MoveTail"
        ShowGrid()

    }
    
}

BEGIN {
    # Origin is lower left
    # Head
    HU=0
    HR=0
    # Tail
    for (i=1;i<=9;i++) {
        TU[i]=HU
        TR[i]=HR
    }
    TOUCH[HU "-" HR]=1
    # Max distance from Origin
    MU=HU+10
    MR=HR+10
}

{

    # print "---"
    print NR,$0
    ShowGrid()

    Direction=$1; 
    Len=$2; 

    # TOUCH[TU "-" TR]=1
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
        for (qq=1;qq<=9;qq++) {
            MoveTail(qq)
        }
        # print "X",HU,HR;
    }
    print "Head End",HU,HR
    BLAH=""
    if ( (HU<0)||(HR<0) ) {
        BLAH = "Origin Error " HU " " HR
        exit 1;
    }
    # TOUCH[TU "-" TR]=1

    if (HR>MR) { MR=HR }
    if (HU>MU) { MU=HU }

    print "Final"
    ShowGrid()

}

END {
    foo = ShowGrid()
    print "RESULT: " foo " " BLAH
}