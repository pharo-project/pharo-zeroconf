accessing scripts 64
combined64Scripts
	^ Array streamContents: [ :stream |
		self image64Scripts 
			select: #canBeCombined
			thenDo: [ :each | 
				((self vmScriptsVersion: each release)
				 	do: #be64bits)
					do: [ :vm | stream nextPut: (each, vm) be64bits ] ] ]