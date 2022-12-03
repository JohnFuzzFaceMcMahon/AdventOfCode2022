BEGIN {
    Rock=1 # A
    Paper=2 # B
    Scissors=3 # C
    Win=6 # Z
    Draw=3 # Y
    Lost=0 # X
    # Your Results, Points To Opponent, Points To You
    Points["AX"]="LOSE,"    Win+Rock        ","     Lose+Scissors       # OK
    Points["AY"]="TIE,"     Draw+Rock        ","    Draw+Rock           # OK
    Points["AZ"]="WIN,"     Lose+Rock       ","     Win+Paper           # OK
    Points["BX"]="LOSE,"    Win+Paper       ","     Lose+Rock           # OK
    Points["BY"]="TIE,"     Draw+Paper      ","     Draw+Paper          # OK
    Points["BZ"]="WIN,"     Lose+Paper      ","     Win+Scissors        # OK
    Points["CX"]="LOSE,"    Win+Scissors    ","     Lose+Paper          # OK
    Points["CY"]="TIE,"     Draw+Scissors   ","     Draw+Scissors       # OK    
    Points["CZ"]="WIN,"     Lose+Scissors   ","     Win+Rock            # OK 
    MyScore=0
    TheirScore=0;
    # for (i in Points) {
    #   print "4",i,Points[i]
    # }
}

{
    for (i in Points) {
        gsub("[\r\n]","",$0)
        split(Points[i],ARRAY,",")
        Mover=$1 "" $2
        # print i, Points[i], ARRAY[1], ARRAY[2], ARRAY[3], $1, $2, Mover
        if (i == Mover) {
            TheirScore=TheirScore+ARRAY[2]
            MyScore=MyScore+ARRAY[3]
            print NR " Moves " i " Result " ARRAY[1] " Their Score (+" ARRAY[2] ") " TheirScore " My Score (+" ARRAY[3] ") " MyScore
        }
    }
}

END {

}