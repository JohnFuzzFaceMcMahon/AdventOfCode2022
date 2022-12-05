BEGIN {
	InStacks=1 # Zero indicates move section
}

{
	gsub("[\r\n]","",$0);
	if ($0=="") InStacks=0;
	# print "--- " NR " "  InStacks " " $0;
	if (InStacks) {
		for (i=1;i<=9;i++) {
			x=2+4*(i-1); # Position in the text line
			item=substr($0,x,1)
			ProcessThis=1
			if ( item=="" ) ProcessThis=0
			if ( index("ABCDEFGHIJKLMNOPQRSTUVWXYZ",item)==0 ) ProcessThis=0
			if (ProcessThis) {
				Stack[i]=Stack[i] item
			}
		}
	} else {
		split($0,WorkArray)
		if ( WorkArray[1]=="move" ) {
			# Top Crates
			item=substr(Stack[ WorkArray[4] ], 1, WorkArray[2]);
			# Remove From Stack
			Stack[ WorkArray[4] ]=substr( Stack[ WorkArray[4] ], WorkArray[2]+1 )
			# Put On New Stack
			Stack[ WorkArray[6] ]=item Stack[ WorkArray[6] ]
			# for (j=1;j<=9;j++) {
			#	print "+++",i,j,Stack[j]
			# }
		}
	}
}

END {
	printf("Result: ");
	for (j=1;j<=9;j++) {
		printf("%s",substr(Stack[j],1,1));
	}
	print ""

}
