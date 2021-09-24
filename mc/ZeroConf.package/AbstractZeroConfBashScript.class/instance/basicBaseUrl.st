accessing
basicBaseUrl
	^ baseUrl ifNil: [ self class baseUrl ]