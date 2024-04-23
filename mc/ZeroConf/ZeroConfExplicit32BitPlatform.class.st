Class {
	#name : 'ZeroConfExplicit32BitPlatform',
	#superclass : 'ZeroConfCurrentPlatform',
	#category : 'ZeroConf',
	#package : 'ZeroConf'
}

{ #category : 'generation' }
ZeroConfExplicit32BitPlatform >> baseUrlFor: aScript [

	"Default scripts are hosted in the 32 bit subdirectory"
	^ aScript basicBaseUrl / '32'
]

{ #category : 'generation' }
ZeroConfExplicit32BitPlatform >> directoryFor: aScript [

	"32 bit scripts are written in the 32 bit subdirectory"
	^ aScript baseDirectory / '32'
]

{ #category : 'generation' }
ZeroConfExplicit32BitPlatform >> generateArchitectureDetectionOn: aStream [

	super generateArchitectureDetectionOn: aStream.
	aStream cr;
		<<== 'SEARCH FOR THE CORRESPONDING 32bit ARCHITECTURE';
		<< 'case "${ARCH}" in'; cr;
		<< '    x86_64*)    ARCH="x86";;'; cr;
		<< '    *)          OSNAME="UNKNOWN:${ARCH}"'; cr;
		<< 'esac'; cr
]
