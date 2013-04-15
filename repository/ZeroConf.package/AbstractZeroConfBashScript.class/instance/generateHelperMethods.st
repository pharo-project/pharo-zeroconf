script generation
generateHelperMethods
	self 
		<< '# define an echo that only outputs to stderr'; cr;
		<< 'echoerr() { echo "$@" 1>&2; }'; cr;
		<< '#  try to use curl if possible'; cr;
		<< 'if [[ `which curl` ]]; then
	DOWNLOAD="curl --silent --location --compressed ";
	DOWNLOAD_TO="$DOWNLOAD --output ";
elif [[ `which wget` ]]; then
	DOWNLOAD_TO="wget --quiet --output-document=";
	DOWNLOAD="$DOWNLOAD_TO-";
else;
	echo "Please install curl or wget on your machine";
	exit 1
fi'; cr; cr