BEGIN {
	FSRoot="/tmp/FileSystemRoot";

	cmd="find " FSRoot " -type f"
	FI=0
	for (; (cmd | getline cow)>0 ; ) {
		FI++
		FILES[FI]=cow
		print "FILES[" FI "]='" FILES[FI] "'"
	}
	cmd="find " FSRoot " -type d"
	DI=0
	for (; (cmd | getline cow)>0 ; ) {
		DI++
		DIRS[DI]=cow
		print "DIRS[" DI "]='" DIRS[DI] "'"
	}
	for ( x in DIRS ) {
		TOTAL[x]=0;
		# print "XLOOP",x,DIRS[x]
		for ( y in FILES ) {
			# print "YLOOP",x,DIRS[x]
			burp=index(FILES[y],DIRS[x])
			# print "BURP",burp;
			if ( burp>0 ) {
				# print "OK " DIRS[x],FILES[y]
				split(FILES[y],ARRAY,":::");
				TOTAL[x]=TOTAL[x]+ARRAY[2];
			} else {
				# print "NO " DIRS[x],FILES[y]
			}
		}

	}
	SECONDTOTAL=0;
	for (x in DIRS) {
		print x, DIRS[x], TOTAL[x];
		if ( TOTAL[x]<=100000 ) {
			SECONDTOTAL=SECONDTOTAL + TOTAL[x];
		}
	}
	print "Result: " SECONDTOTAL;

}
