accessing
defaultBasename
	^ String streamContents: [ :stream | | scriptsWithBasename |
		scriptsWithBasename := self scripts select: [ :each| 
			each hasBasename ].
		scriptsWithBasename
			do: [ :script | stream nextPutAll: script basename ]
			separatedBy: [ stream nextPut: $+ ]]