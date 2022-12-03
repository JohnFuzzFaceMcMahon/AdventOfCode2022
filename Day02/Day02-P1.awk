BEGIN {
    Rock=1 # A,X
    Paper=2 # B,Y
    Scissors=3 # C, Z
    Win=6
    Draw=3
    Lost=0
    # Your Results, Points To Opponent, Points To You
    Points["AX"]="TIE,"     Draw+Rock       ","     Draw+Rock
    Points["AY"]="WIN,"     Lost+Rock       ","     Win+Paper
    Points["AZ"]="LOSE,"    Win+Rock        ","     Lose+Scissors
    Points["BX"]="LOSE,"    Win+Paper       ","     Lose+Rock
    Points["BY"]="TIE,"     Draw+Paper      ","     Draw+Paper
    Points["BZ"]="WIN,"     Lose+Paper      ","     Win+Scissors
    Points["CX"]="WIN,"     Lose+Scissors   ","     Win+Rock
    Points["CY"]="LOSE,"    Win+Scissors    ","     Lose+Paper    
    Points["CZ"]="TIE,"     Draw+Scissors   ","     Draw+Scissors
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
            print NR " Moves " i " " ARRAY[1] " Their Score (+" ARRAY[2] ") " TheirScore " My Score (+" ARRAY[3] ") " MyScore
        }
    }
}

END {

}