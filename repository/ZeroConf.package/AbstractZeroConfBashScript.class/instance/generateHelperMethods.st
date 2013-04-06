script generation
generateHelperMethods
	self 
		<< '# define an echo that only outputs to stderr'; cr;
		<< 'echoerr() { echo "$@" 1>&2; }'; cr;
		<< '#  try to use curl if possible'; cr;
		<< 'if [[ `which curl` ]]; then
	DOWNLOAD="curl --silent --location --compressed ";
	DOWNLOAD_TO="$DOWNLOAD --output ";
else
	DOWNLOAD_TO="wget --quiet --output-document=";
	DOWNLOAD="$DOWNLOAD_TO-";
fi'; cr; cr