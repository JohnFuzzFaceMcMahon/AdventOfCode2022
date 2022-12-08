function DumpVisible (i,j) {
    for (j=1;j<=y;j++) {
        for (i=1;i<=x;i++) {
            printf("%d",VISIBLE[ i "_" j])
        }
        print "";
    }
}

function DumpTrees (i,j) {
    for (j=1;j<=y;j++) {
        for (i=1;i<=x;i++) {
            printf("%d",ARRAY[ i "_" j])
        }
        print "";
    }
}

BEGIN {
    y=0
}

# X increases to the right 
# Y increases downward


{
    gsub("\r","",$0)
    # print length($0)
    # print "'" $0 "'"
    y++
    for (x=1;x<=length($0);x++) {
        ARRAY[ x "_" y ]=substr($0,x,1)
    }
    x=length($0)
}

END {
    # Make Edges Visible
    for (xx=1;xx<=x;xx++) {
        # Top Row
        yy=1;
        VISIBLE[ xx "_" yy ]=0
        # Bottom Row
        yy=y
        VISIBLE[ xx "_" yy ]=0
    }
    for (yy=1;yy<=y;yy++) {
        # Left side 
        xx=1
        VISIBLE[ xx "_" yy ]=0
        # Right side
        xx=x
        VISIBLE[ xx "_" yy ]=0
    }
    # print "-----"
    # Edges are set to visible, now evaluate each "inside" element
    for (xxx=2;xxx<=x-1;xxx++) {
        for (yyy=2;yyy<=(y-1);yyy++) {
            TreeHeight=ARRAY[ xxx "_" yyy]
            print "Looking at " xxx " " yyy
            # Look Right 
            yyyy=yyy
            Check=""
            for (xxxx=xxx+1;xxxx<=x;xxxx++) {
                if (TreeHeight>ARRAY[ xxxx "_" yyyy]) {
                    Check=Check "S"
                } else {
                    Check=Check "T"
                }
            }
            #print "Check R",Check
            gsub("T.*$","T",Check)
            VISIBLE[ xxx "_" yyy]=length(Check)
            # Look Left 
            yyyy=yyy
            Check=""
            for (xxxx=xxx-1;xxxx>=1;xxxx--) {
                if (TreeHeight>ARRAY[ xxxx "_" yyyy]) {
                    Check=Check "S"
                } else {
                    Check=Check "T"
                }
            }
            #print "Check L",Check
            gsub("T.*$","T",Check)
            VISIBLE[ xxx "_" yyy]=length(Check)*VISIBLE[ xxx "_" yyy]
            # Look Up/Top 
            xxxx=xxx
            Check=""
            for (yyyy=yyy-1;yyyy>=1;yyyy--) {
                if (TreeHeight>ARRAY[ xxxx "_" yyyy]) {
                    Check=Check "S"
                } else {
                    Check=Check "T"
                }
            }
            #print "Check T",Check
            gsub("T.*$","T",Check)
            VISIBLE[ xxx "_" yyy]=length(Check)*VISIBLE[ xxx "_" yyy]       
            # Look Down/Bottom
            xxxx=xxx
            Check=""
            for (yyyy=yyy+1;yyyy<=y;yyyy++) {
                if (TreeHeight>ARRAY[ xxxx "_" yyyy]) {
                    Check=Check "S"
                } else {
                    Check=Check "T"
                }
            }
            #print "Check B",Check
            gsub("T.*$","T",Check)
            VISIBLE[ xxx "_" yyy]=length(Check)*VISIBLE[ xxx "_" yyy]
            #print xxx,yyy
            #print VISIBLE[ xxx "_" yyy]
            #DumpTrees()
            #print "-"
            #DumpVisible()
        }        
    }
    MaxMax=0
    MaxX=0
    MaxY=0
    for (xxxxx=1;xxxxx<=x;xxxxx++) {
        for (yyyyy=1;yyyyy<=y;yyyyy++) {
            if (VISIBLE[ xxxxx "_" yyyyy]>MaxMax) {
                MaxMax=VISIBLE[ xxxxx "_" yyyyy]
                MaxX=xxxxx
                MaxY=yyyyy
            }
        }
    }
    print "Result " MaxMax " at " MaxX "," MaxY
    # DumpTrees()
    # print "-"
    # DumpVisible()
}