function parse( a, b,   i ) {
    for (i=2;i<=(length(a)-1);i++) {

    }    
}

BEGIN {
    # Left Or Right Input?
    Left=1
}

{
    InputLine=$0;
    gsub("[\r\n]","",InputLine)
    print Left,InputLine
    if (Left==1) { Left=0 }
    if (InputLine=="") { Left=1 }
}

END {
    
}

