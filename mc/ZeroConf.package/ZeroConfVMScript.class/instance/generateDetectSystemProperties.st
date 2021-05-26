script generation
generateDetectSystemProperties
	self 
		<<== 'DETECT SYSTEM PROPERTIES';
		<< 'vmArchOut="$(uname -m)"'; cr;
		<< 'case "${vmArchOut}" in'; cr;
		<< '    x*)         VM_ARCH=x86_64;;'; cr;
		<< '    i*)         VM_ARCH=x86;;'; cr;
		<< '    arm*|ARM*)  VM_ARCH="${vmArchOut}";;'; cr;
		<< '    *)          VM_ARCH="UNKNOWN:${vmArchOut}";;'; cr;
		<< 'esac'; cr;
		<< 'unameOut="$(uname -s)"'; cr;
		<< 'case "${unameOut}" in'; cr;
		<< '    Linux*)     OSNAME=Linux;;'; cr;
		<< '    Darwin*)    OSNAME=Darwin;;'; cr;
		<< '    CYGWIN*)    OSNAME=Windows;;'; cr;
		<< '    MINGW*)     OSNAME=Windows;;'; cr;
		<< '    *)          OSNAME="UNKNOWN:${unameOut}"'; cr;
		<< 'esac'; cr