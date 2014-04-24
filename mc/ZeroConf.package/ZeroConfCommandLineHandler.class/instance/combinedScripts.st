accessing
combinedScripts
	^ Array streamContents: [ :stream |
		self imageScripts do: [ :image | 
			self vmScripts do: [ :vm |
				stream nextPut: image, vm ]]]