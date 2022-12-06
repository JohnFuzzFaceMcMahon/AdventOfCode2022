BEGIN {
	Total=0
}

{

	for (i=1;i<=length($0);i++) {
		PossibleMarker=substr($0,i,4)
		Unique=1; # Assume they are unique
		for (j=97;j<=122;j++) {
			TestChar=sprintf("%c",j);
			TestPossibleMarker=PossibleMarker
			if ( gsub(TestChar,"",TestPossibleMarker)>1 ) {
				Unique=0
			} 
		}
		if ( Unique ) {
                        if (ActualMarker=="") {
                                ActualMarker=PossibleMarker "(" i+3 ")"
                        } else {
                                ActualMarker=ActualMarker "," PossibleMarker "(" i+3 ")"
                        }
			Total=Total+i+3
			break
		}
	}

}

END {
	print "Result: " Total " [" ActualMarker "]"
}
