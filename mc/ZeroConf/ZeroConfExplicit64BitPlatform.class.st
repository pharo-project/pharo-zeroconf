Class {
	#name : #ZeroConfExplicit64BitPlatform,
	#superclass : #ZeroConfCurrentPlatform,
	#category : 'ZeroConf'
}

{ #category : #generation }
ZeroConfExplicit64BitPlatform >> baseUrlFor: aScript [

	"Default scripts are hosted in the 64 bit subdirectory"
	^ aScript basicBaseUrl / '64'
]

{ #category : #generation }
ZeroConfExplicit64BitPlatform >> directoryFor: aScript [

	"64 bit scripts are written in the 64 bit subdirectory"
	^ aScript baseDirectory / '64'
]

{ #category : #generation }
ZeroConfExplicit64BitPlatform >> generateArchitectureDetectionOn: aStream [

	super generateArchitectureDetectionOn: aStream.
	aStream cr;
		<<== 'SEARCH FOR THE CORRESPONDING 64bit ARCHITECTURE';
		<< 'case "${ARCH}" in'; cr;
		<< '    x86*)    ARCH="x86_64";;'; cr;
		<< '    *)       OSNAME="UNKNOWN:${ARCH}"'; cr;
		<< 'esac'; cr
]
