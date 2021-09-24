generation
generateOperatingSystemDetectionOn: aStream

	aStream <<== 'DETECT SYSTEM PROPERTIES'.
	self generateArchitectureDetectionOn: aStream.
	aStream cr;
		<< 'VM_ARCH=${ARCH}'; cr;
		<< 'unameOut="$(uname -s)"'; cr;
		<< 'case "${unameOut}" in'; cr;
		<< '    Linux*)     OSNAME=Linux;;'; cr;
		<< '    Darwin*)    OSNAME=Darwin;;'; cr;
		<< '    CYGWIN*)    OSNAME=Windows;;'; cr;
		<< '    MINGW*)     OSNAME=Windows;;'; cr;
		<< '    *)          OSNAME="UNKNOWN:${unameOut}"'; cr;
		<< 'esac'; cr