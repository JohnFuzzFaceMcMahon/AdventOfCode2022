function status() {
    Signal[Cycle]=Cycle*X
    if ( index(ICycle,":" Cycle ":")>0 ) {
        print "Adding on " Cycle " value " Signal[Cycle] " ISS was " ISS " ISS now " ISS+Signal[Cycle]
        ISS=ISS+Signal[Cycle]
        Interesting=40
    }
    print Cycle ") '" X "' '" Command "' '" Value "' '" Signal[Cycle] "' '" ISS "'"  
}

function draw() {
    for (j=0;j<7;j++) {
        for (i=0;i<40;i++) {
            if (PIXEL[40*j+i]==1) {
                printf "#";
            } else {
                printf "."
            }
        }
        print "";
    }
}

function abs(v) {return v < 0 ? -v : v}

function TryDraw() {

    RawPos=Cycle-1

    DrawRow=int(RawPos/40)
    DrawCol=RawPos-DrawRow*40

    TestAt=RawPos
    SpriteDelta=abs(DrawCol-X)

    print "Cow",Cycle,RawPos,DrawRow,DrawCol,TestAt,SpriteDelta

    if ( SpriteDelta<= 1) {
        PIXEL[RawPos]=1
    }

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
        TryDraw()
        draw()
        Cycle++
    }
    if (Command=="addx") {
        # First Cycle - Do Nothing
        Command="addx-wait"
        status()
        TryDraw()
        draw()
        Cycle++

        # Second Cycle - Change X
        Command="addx"
        status()
        TryDraw()
        draw()
        Cycle++
        X=X+Value
    }

}

END {
    print "END OF LINE"
    status()
    draw()
}