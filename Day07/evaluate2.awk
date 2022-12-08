BEGIN {
	FSRoot="/tmp/FileSystemRoot";
	# FSRoot="/tmp/FileSystemRoot-TEST";
	TotalDiskSpace=70000000

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
			split(FILES[y],ARRAY,":::");
			if (x==1) DISKTOTAL=DISKTOTAL+ARRAY[2];
			# print "YLOOP",x,DIRS[x]
			burp=index(FILES[y],DIRS[x])
			# print "BURP",burp;
			if ( burp>0 ) {
				# print "OK " DIRS[x],FILES[y]
				TOTAL[x]=TOTAL[x]+ARRAY[2];
			} else {
				# print "NO " DIRS[x],FILES[y]
			}
		}

	}
	DISKFREE=TotalDiskSpace-DISKTOTAL
	print "DISKFREE: " DISKFREE 
	smallestX=0
	smallestFREE=DISKTOTAL+1;
	for (x in DIRS) {
		if ( DISKFREE+TOTAL[x]>30000000 ) {
			print x, DIRS[x], TOTAL[x], DISKFREE+TOTAL[x];
			if ( DISKFREE+TOTAL[x]<smallestFREE ) {
				smallestX=x
				smallestFREE=DISKFREE+TOTAL[x]
			}
		}
	}
	print "Result: " TOTAL[smallestX] " " DIRS[x];

}
