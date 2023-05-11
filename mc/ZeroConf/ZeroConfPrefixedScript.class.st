"
I combine several ZeroConf scripts which are treated as prefix for code generation.
The final script name is not altered by the prefix.

Example:
========
	prefiexedScript := scriptA / scriptB.

Then the output script is in `scriptA basename / scriptB basename, '.sh'` and the final script will have both the contents of `scriptA` and `scriptB`
"
Class {
	#name : #ZeroConfPrefixedScript,
	#superclass : #ZeroConfCombinedScript,
	#instVars : [
		'prefixScripts'
	],
	#category : 'ZeroConf'
}

{ #category : #'instance creation' }
ZeroConfPrefixedScript class >> withPrefix: aScript [
	^ self new
		addPrefix: aScript;
		yourself
]

{ #category : #'instance creation' }
ZeroConfPrefixedScript class >> withPrefix: aScript with: anotherScript [
	^ self new
		addPrefix: aScript;
		addPrefix: anotherScript;
		yourself
]

{ #category : #combining }
ZeroConfPrefixedScript >> / otherZeroConf [
	^ otherZeroConf prefixedWithAll: self
]

{ #category : #accessing }
ZeroConfPrefixedScript >> addAllPrefix: moreScripts [
	^ prefixScripts addAll: moreScripts
]

{ #category : #accessing }
ZeroConfPrefixedScript >> addPrefix: script [
	^ prefixScripts add: script
]

{ #category : #accessing }
ZeroConfPrefixedScript >> defaultDirectory [
	| fileReference |
	fileReference := FileLocator workingDirectory.
	self prefixScripts do: [ :script |
		fileReference := fileReference / script basename ].
	^ fileReference
]

{ #category : #combining }
ZeroConfPrefixedScript >> for32Bits [

	| copy |
	copy := super for32Bits.
	copy prefixScripts: (copy prefixScripts collect: [ :subscript | subscript for32Bits ]).
	^ copy
]

{ #category : #combining }
ZeroConfPrefixedScript >> for64Bits [

	| copy |
	copy := super for64Bits.
	copy prefixScripts: (copy prefixScripts collect: [ :subscript | subscript for64Bits ]).
	^ copy
]

{ #category : #'script generation' }
ZeroConfPrefixedScript >> generatePrefixScripts [

	self prefixScripts do: [ :script |
		script generateBodyOn: self outputStream.
		self cr. ].
]

{ #category : #'script generation' }
ZeroConfPrefixedScript >> generateScripts [
		
	^ self prefixScripts, self scripts
]

{ #category : #'initialize-release' }
ZeroConfPrefixedScript >> initialize [
	prefixScripts := OrderedCollection new.
	^ super initialize
]

{ #category : #accessing }
ZeroConfPrefixedScript >> prefixScripts [
	^ prefixScripts
]

{ #category : #accessing }
ZeroConfPrefixedScript >> prefixScripts: aCollection [
	
	prefixScripts := aCollection
]
