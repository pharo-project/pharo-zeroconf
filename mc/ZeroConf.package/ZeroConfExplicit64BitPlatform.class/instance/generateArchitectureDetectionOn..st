generation
generateArchitectureDetectionOn: aStream

	super generateArchitectureDetectionOn: aStream.
	aStream cr;
		<<== 'SEARCH FOR THE CORRESPONDING 64bit ARCHITECTURE';
		<< 'case "${ARCH}" in'; cr;
		<< '    x86*)    ARCH="x86_64";;'; cr;
		<< '    *)       OSNAME="UNKNOWN:${ARCH}"'; cr;
		<< 'esac'; cr