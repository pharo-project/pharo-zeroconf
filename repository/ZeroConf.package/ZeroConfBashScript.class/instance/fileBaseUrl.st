accessing
fileBaseUrl
	^ fileBaseUrl ifNil: [ self class fileBaseUrl ]