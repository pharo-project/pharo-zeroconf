generation
generateArchitectureDetectionOn: aStream

	super generateArchitectureDetectionOn: aStream.
	aStream cr;
		<<== 'SEARCH FOR THE CORRESPONDING 32bit ARCHITECTURE';
		<< 'case "${ARCH}" in'; cr;
		<< '    x86_64*)    ARCH="x86";;'; cr;
		<< '    *)          OSNAME="UNKNOWN:${ARCH}"'; cr;
		<< 'esac'; cr