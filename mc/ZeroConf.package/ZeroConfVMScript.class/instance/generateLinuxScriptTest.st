script generation
generateLinuxScriptTest
	self
		<<== 'TEST VM REQUIREMENTS UNDER LINUX'
		<< 'if [ "$OS" == "linux" ]; then
	$PHARO_VM '<< self optionDash <<'help '<< self optionDash <<'vm-display-null &> /dev/null 2>&1 || (\
		echo "On a 64-bit system? You must install the 32-bit libraries"; \
		echo ''   Try `sudo aptitude install ia32-libs` or see http://pharo.org/gnu-linux-installation#64-bit-System-Setup for more info'' )
fi'; cr
