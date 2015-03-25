accessing
basenameForCombinedIn: script 
	| baseScript |
	baseScript := script scripts first.
	^ baseScript isImage 
		ifTrue: [ self commonBasename ]
		ifFalse: [ self basename ] 