"
I generate a simple script which downloads a Pharo image from an url: 

http://files.pharo.org/get-files/VERSION 

"
Class {
	#name : 'ZeroConfImageVersionScript',
	#superclass : 'ZeroConfPharoImageScript',
	#category : 'ZeroConf-Unity',
	#package : 'ZeroConf',
	#tag : 'Unity'
}

{ #category : 'testing' }
ZeroConfImageVersionScript >> canBeCombined [
	^ true
]

{ #category : 'script generation' }
ZeroConfImageVersionScript >> generateBody [
	self generateVersionProperties; cr; cr.
	super generateBody
]

{ #category : 'script generation' }
ZeroConfImageVersionScript >> generateVersionProperties [

	self <<== 'RELEASE VERSION'.
	platform generateArchitectureDetectionOn: self.
	self cr
		<< 'VERSION="'; << self release asString; << '"'; cr;
		<< 'FILES_URL="http://files.pharo.org/get-files/${VERSION}"'; cr;
		<< 'IMAGE_FILE_NAME="'; << self imageFileName; << '-${ARCH}"'; cr.
]

{ #category : 'accessing' }
ZeroConfImageVersionScript >> imageFileName [
	^ 'pharoImage'
]

{ #category : 'accessing' }
ZeroConfImageVersionScript >> imageUrl [
	^ '${FILES_URL}/${IMAGE_FILE_NAME}.zip'
]

{ #category : 'printing' }
ZeroConfImageVersionScript >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: self imageFileName;
		nextPutAll: version asString;
		nextPutAll: release asString;
		nextPutAll: ')'
]
