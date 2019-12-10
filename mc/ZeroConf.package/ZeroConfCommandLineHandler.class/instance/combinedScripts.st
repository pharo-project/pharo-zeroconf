accessing scripts
combinedScripts
	^ Array streamContents: [ :stream |
		(self imageScripts 
			select: #canBeCombined)
			do: [ :each | 
				((self vmScriptsVersion: each release)
					select: #has32bit) 
					do: [ :vm | stream nextPut: each, vm ] ] ]