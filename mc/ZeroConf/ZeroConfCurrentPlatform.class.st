Class {
	#name : #ZeroConfCurrentPlatform,
	#superclass : #Object,
	#category : #ZeroConf
}

{ #category : #generation }
ZeroConfCurrentPlatform >> baseUrlFor: aScript [

	"Default scripts are hosted in the root"
	^ aScript basicBaseUrl
]

{ #category : #generation }
ZeroConfCurrentPlatform >> directoryFor: aScript [

	"Default scripts are written in the root"
	^ aScript baseDirectory
]

{ #category : #generation }
ZeroConfCurrentPlatform >> generateArchitectureDetectionOn: aStream [

	aStream << 'ARCH=`uname -m`'
]

{ #category : #generation }
ZeroConfCurrentPlatform >> generateOperatingSystemDetectionOn: aStream [

	aStream <<== 'DETECT SYSTEM PROPERTIES'.
	self generateArchitectureDetectionOn: aStream.

	aStream cr;
		<< 'VM_ARCH=${ARCH}'; cr;
		<< 'unameOut="$(uname -s)"'; cr;
		<< 'case "${unameOut}" in'; cr;
		<< '    Linux*)     OSNAME=Linux;;'; cr;
		<< '    Darwin*)    OSNAME=Darwin;;'; cr;
		<< '    MSYS*|CYGWIN*|MINGW*)     OSNAME=Windows;;'; cr;
		<< '    *)          OSNAME="UNKNOWN:${unameOut}"'; cr;
		<< 'esac'; cr
]
