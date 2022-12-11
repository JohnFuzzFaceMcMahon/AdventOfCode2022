# https://unix.stackexchange.com/questions/220588/how-to-take-the-absolute-value-using-awk
function abs(v) {return v < 0 ? -v : v}

function ShowPlot() {
    printf("   ")
    for (m=0;m<=MR;m++) printf("%s  ",m)
    print ""
    printf("  +")
    for (m=0;m<=MR;m++) printf("--+")
    print ""
    for (j=MU;j>-1;j--) {
        for (k=0;k<=MR;k++) {
            Contents=""
            if (k==0) { printf("%s |",j) }
            if ((k==HR)&&(j==HU)) {
                Contents="H";
            }
            if ((k==TR)&&(j==TU)) {
                Contents=Contents "T";
            }
            if (Contents=="") Contents=".."
            printf("%2s|",Contents)
        }
        print "";
        printf("  +")
        for (m=0;m<=MR;m++) printf("--+")
        print ""
    }
}

BEGIN {
    # Head, number of steps up and number of steps right
    HU=0
    HR=0
    # Tail, same thing
    TU=0
    TR=0
    # Max Of U and R 
    MU=0
    MR=0
}

{
    print NR " Command " $0;
    # ShowPlot()
    Direction=$1
    Amount=$2
    if ((Direction=="R")||(Direction=="L")) {
        for (i=1;i<=Amount;i++) {
            if (Direction=="R") {
                HR=HR+1
                if (HR>MR) MR=HR
            } else {
                HR=HR-1
            }
        }
    }
    if ((Direction=="U")||(Direction=="D")) {
        for (i=1;i<=Amount;i++) {
            if (Direction=="U") {
                HU=HU+1
                if (HU>MU) MU=HU
            } else {
                HU=HU-1
            }
        }
    }
    print NR " After Head Move " $0;
    # ShowPlot()
    VISITED[TR "-" TU]=1
    DidSomething=1
    for (; DidSomething==1 ;) {
        DidSomething=0
        DeltaU=HU-TU
        DeltaR=HR-TR
        print HU,TU,DeltaU,".",HR,TR,DeltaR
        # Vertical Change?
        if (HU==TU) {
            if (DeltaR>1)   { TR=TR+1; print "A"; DidSomething=1; }
            if (DeltaR<-1)  { TR=TR-1; print "B"; DidSomething=1; }
        }
        # Horizontal Change?
        if ((HR==TR)&&(DidSomething==0)) {
            if (DeltaU>1)   { TU=TU+1 ; print "C"; DidSomething=1;}
            if (DeltaU<-1)  { TU=TU-1 ; print "D"; DidSomething=1;}
        }
        if ( DidSomething==0 ) {
         if ( (abs(DeltaU)>1)||abs(DeltaR)>1 ) {   
            # Move Up, Move Right
            if ((DeltaU>0)&&(DeltaR>0)) { TU=TU+1; TR=TR+1; print "E"; DidSomething=1; }
            # Move Down, Move Right
            if ((DeltaU<0)&&(DeltaR>0)) { TU=TU-1; TR=TR+1; print "F"; DidSomething=1;}
            # Moce Down, Move Left       
            if ((DeltaU<0)&&(DeltaR<0)) { TU=TU-1; TR=TR-1; print "G"; DidSomething=1;}
            # Move Up, Move Left
            if ((DeltaU>0)&&(DeltaR<0)) { TU=TU+1; TR=TR-1; print "H"; DidSomething=1; }
         } else {
            print "X";
         }
        }
        VISITED[TR "-" TU]=1
    }
    print NR " After Tail Move " $0;
    # ShowPlot()
}

END {
    for (n=MU;n>-1;n--) {
        for (p=0;p<=MR;p++) {
            if ( VISITED[p "-" n]==1) {
                printf("#")
                TOTAL++
            } else {
                printf(".")
            }
        }
        print ""
    }
    print "RESULT: " TOTAL

}