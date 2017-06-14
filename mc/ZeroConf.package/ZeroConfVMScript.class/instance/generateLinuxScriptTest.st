script generation
generateLinuxScriptTest
	self
		<<== 'TEST VM REQUIREMENTS UNDER LINUX'
		<< 'if [ "$OS" == "linux" ]; then
	$PHARO_VM '<< self optionDash <<'help '<< self optionDash <<'vm-display-null &> /dev/null 2>&1 || (\
		echo "On a 64-bit system? You must enable and install the 32-bit libraries"; \
		echo "   Please see http://pharo.org/gnu-linux-installation for detailed instructions" )
fi'; cr
