script generation
generateHelperMethods
	self 
		<< '# define an echo that only outputs to stderr'; cr;
		<< 'echoerr() { echo "$@" 1>&2; }'; cr;
		generateCurlWgetDetect; cr; cr