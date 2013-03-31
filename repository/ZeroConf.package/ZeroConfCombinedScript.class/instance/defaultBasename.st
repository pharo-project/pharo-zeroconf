accessing
defaultBasename
	^ String streamContents: [ :stream |
		self scripts 
			do: [ :script | stream nextPutAll: script basename ]
			separatedBy: [ stream nextPut: $+ ]]