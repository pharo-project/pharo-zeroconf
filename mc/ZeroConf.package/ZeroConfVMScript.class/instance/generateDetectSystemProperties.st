script generation
generateDetectSystemProperties
	self 
		<<== 'DETECT SYSTEM PROPERTIES';
		<< 'VM_ARCH=`uname -m`'; cr;
		<< 'unameOut="$(uname -s)"'; cr;
		<< 'case "${unameOut}" in'; cr;
		<< '    Linux*)     OSNAME=Linux;;'; cr;
		<< '    Darwin*)    OSNAME=Darwin;;'; cr;
		<< '    CYGWIN*)    OSNAME=Windows;;'; cr;
		<< '    MINGW*)     OSNAME=Windows;;'; cr;
		<< '    *)          OSNAME="UNKNOWN:${unameOut}"'; cr;
		<< 'esac'; cr