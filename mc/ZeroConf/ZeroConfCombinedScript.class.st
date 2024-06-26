"
I combine several ZeroConf scripts.
For simplicity I simply download and execute each subscript separately.
"
Class {
	#name : 'ZeroConfCombinedScript',
	#superclass : 'AbstractZeroConfBashScript',
	#instVars : [
		'scripts'
	],
	#category : 'ZeroConf',
	#package : 'ZeroConf'
}

{ #category : 'instance creation' }
ZeroConfCombinedScript class >> with: aScript [ 
	^ self new
		add: aScript;
		yourself
]

{ #category : 'instance creation' }
ZeroConfCombinedScript class >> with: aScript with: anotherScript [
	^ self new
		add: aScript;
		add: anotherScript;
		yourself
]

{ #category : 'combining' }
ZeroConfCombinedScript >> , otherZeroConf [
	^ otherZeroConf combinedWithAll: self
]

{ #category : 'subscripts' }
ZeroConfCombinedScript >> add: aZeroConfScript [
	^ scripts add: aZeroConfScript
]

{ #category : 'subscripts' }
ZeroConfCombinedScript >> addAll: newScripts [
	^ scripts addAll: newScripts
]

{ #category : 'accessing' }
ZeroConfCombinedScript >> artifactDescription [
	| artifactDescription |
	artifactDescription := Dictionary new.
	self scripts do: [  :script |
		script artifactDescription keysAndValuesDo: [ :artifact :description | 
			artifactDescription 
				at: artifact 
				ifPresent: [ Error signal: 'Subscripts cannot generate the same artifact: ', artifact ].
				artifactDescription 	at: artifact put: description.
			]].
	
 	^ artifactDescription
]

{ #category : 'accessing' }
ZeroConfCombinedScript >> defaultBasename [
	^ String streamContents: [ :stream | 
		(self scripts 
			select: #hasBasename)
			do: [ :each | stream nextPutAll: (each basenameForCombinedIn: self) ]
			separatedBy: [ stream nextPut: $+ ] ]
]

{ #category : 'accessing' }
ZeroConfCombinedScript >> description [
	^ String streamContents:  [ :stream |
		self scripts do: [ :script | 
			stream nextPutAll: script description; cr]]
]

{ #category : 'accessing' }
ZeroConfCombinedScript >> for32Bits [

	| copy |
	copy := super for32Bits.
	copy scripts: (copy scripts collect: [ :subscript | subscript for32Bits ]).
	^ copy
]

{ #category : 'accessing' }
ZeroConfCombinedScript >> for64Bits [

	| copy |
	copy := super for64Bits.
	copy scripts: (copy scripts collect: [ :subscript | subscript for64Bits ]).
	^ copy
]

{ #category : 'script generation' }
ZeroConfCombinedScript >> generateBody [
	self <<== 'DOWNLOAD SUB-SCRIPTS'.
	self generateScripts do: [ :script |
		self generateDownloadFor: script ]
]

{ #category : 'accessing' }
ZeroConfCombinedScript >> generateScripts [
	"Returns a list of zeroconf script objects that are used to generate the final bash script"
	^ self scripts
]

{ #category : 'initialize-release' }
ZeroConfCombinedScript >> initialize [
	super initialize.
	scripts := OrderedCollection new.
]

{ #category : 'testing' }
ZeroConfCombinedScript >> isCombined [
	^ true
]

{ #category : 'accessing' }
ZeroConfCombinedScript >> scripts [
	^ scripts
]

{ #category : 'accessing' }
ZeroConfCombinedScript >> scripts: aCollection [
	
	scripts := aCollection
]
