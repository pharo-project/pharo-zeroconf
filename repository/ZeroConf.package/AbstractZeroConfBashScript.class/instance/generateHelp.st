script generation
generateHelp
	self 
		<<== 'ARGUMENT HANDLING';
		<< 'if { [ "$1" = "-h" ] || [ "$1" = "--help" ]; }; then'; cr;
		<< '	echo "';
		generateHelpMessage;
		<< '"'; cr;
		<< '	exit 0;'; cr;
		<< 'elif [ $# -gt 0 ]; then'; cr;
		<< '	echo "--help is the only argument allowed"'; cr;
		<< '	exit 1;'; cr;
		<< 'fi'; cr