script generation
generateLinuxScriptTest
	self
		<<== 'TEST VM REQUIREMENTS UNDER LINUX';
		<< 'if [ "$OS" == "linux" ]; then
	$PHARO_VM -help -vm-display-null > /dev/null 2>&1 || (\
		echo "Please install the 32bit libraries"; \
		echo "   sudo aptitude install ia32-libs" )
fi'; cr