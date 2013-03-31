accessing
description
	^ String streamContents:  [ :stream |
		self scripts do: [ :script | 
			stream nextPutAll: script description; cr]]