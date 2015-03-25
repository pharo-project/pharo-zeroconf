accessing
defaultBasename
	^ String streamContents: [ :stream | 
		(self scripts 
			select: #hasBasename)
			do: [ :each | stream nextPutAll: (each basenameForCombinedIn: self) ]
			separatedBy: [ stream nextPut: $+ ] ]