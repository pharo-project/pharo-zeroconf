"
I generate a simple script which downloads a Pharo image.
"
Class {
	#name : #ZeroConfPharoImageScript,
	#superclass : #ZeroConfImageScript,
	#category : 'ZeroConf'
}

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo: releaseString [
	"Create a new zeroconf script exporter for the given release.
	A typical release string looks like '30' see also `SystemVersion current majorMinor: ''` "
	^ self new 
		release: releaseString;
		yourself
]
