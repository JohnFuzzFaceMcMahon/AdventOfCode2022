BEGIN {

	RootPath="/tmp/FileSystemRoot";
	CurrentPath=RootPath;


    for(;;) {

	rc = (getline InputString <ARGV[1])
	if (rc<1) {
		print rc;
		print "DONE"
		exit
	}
	split(InputString,ARRAY)
	if ( ARRAY[1]=="$" ) {
		print "COMMAND " InputString;
		# Command
		if (ARRAY[2]=="cd") {
			Directory=ARRAY[3];
			FinishedCD=0
			if (Directory=="/") {
				CurrentPath=RootPath;
				FinishedCD=1;
				print "CD: Setting CP to RP " CurrentPath
			}
			if (Directory=="..") {
				cmd="cd " CurrentPath "; cd ..; pwd;"
				print "CD OUT FROM: " CurrentPath
				cmd | getline CurrentPath
				print "CD OUT TO: " CurrentPath
				FinishedCD=1;
			}
			if (FinishedCD==0) {
				print "CD IN FROM: " CurrentPath
				cmd="cd " CurrentPath "; cd " Directory " ; pwd;"
				cmd | getline CurrentPath;
				print "CD IN TO: " CurrentPath
			}
		}
		if ( ARRAY[2]=="ls" ) {
			print "LS: DO NOTHING"
		}
	} else {
		print "FILE: " InputString
		split(InputString,ARRAYX)
		if ( ARRAYX[1]=="dir" ) {
			cmd="cd " CurrentPath "; mkdir " ARRAYX[2];
			system(cmd);
		} else {
			cmd="cd " CurrentPath "; touch " ARRAYX[2] ":::" ARRAYX[1];
			system(cmd);
		}
	}
	close(cmd);
    }
}
