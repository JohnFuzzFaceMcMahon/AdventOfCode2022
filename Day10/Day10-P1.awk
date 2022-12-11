function status() {
    Signal[Cycle]=Cycle*X
    if ( index(ICycle,":" Cycle ":")>0 ) {
        print "Adding on " Cycle " value " Signal[Cycle] " ISS was " ISS " ISS now " ISS+Signal[Cycle]
        ISS=ISS+Signal[Cycle]
        Interesting=40
    }
    print Cycle ") '" X "' '" Command "' '" Value "' '" Signal[Cycle] "' '" ISS "'"  
}

BEGIN {
    X=1
    Cycle=1
    Interesting=20
    ISS=0
    ICycle=":20:60:100:140:180:220:"
}

{
    gsub("\r","",$0)
    Command=$1
    Value=$2
    # Start Of Cycle
    if (Command=="noop") {
        # 1 Cycle - Do Nothing
        status()
        Cycle++
    }
    if (Command=="addx") {
        # First Cycle - Do Nothing
        Command="addx-wait"
        status()
        Cycle++

        # Second Cycle - Change X
        Command="addx"
        status()
        Cycle++
        X=X + Value
    }

}

END {
    print "END OF LINE"
    status()
}