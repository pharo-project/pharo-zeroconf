script generation
generatePlatformTest
	self << 'TMP_OS=`uname | tr "[:upper:]" "[:lower:]"`
if [[ "{$TMP_OS}" = *linux* ]]; then
    OS="linux";
else
    echo "Unsupported OS (threaded VM is just meant to linux)";
    exit 1;
fi'; cr