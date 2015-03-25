accessing
combinedScripts
	^ Array streamContents: [ :stream |
		(self imageScripts 
			select: #canBeCombined)
			do: [ :each | 
				(self vmScriptsVersion: each release) 
					do: [ :vm | stream nextPut: each, vm ] ] ]