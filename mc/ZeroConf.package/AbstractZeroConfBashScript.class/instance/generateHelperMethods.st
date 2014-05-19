script generation
generateHelperMethods
	self 
		<< '# define an echo that only outputs to stderr'; cr;
		<< 'echoerr() { echo "$@" 1>&2; }'; cr;
		<< 'libc_version_field() { echo `ldd --version | sed -n 1p | cut -d" " -f$1` }'; cr;
		<< 'libc_version() {
	local version=`libc_version_field 5`
	if [ -n $version ]; then
		echo $version
	else 
		echo `libc_version_field 4`
	fi 
}'; cr;
		generateCurlWgetDetect; cr; cr