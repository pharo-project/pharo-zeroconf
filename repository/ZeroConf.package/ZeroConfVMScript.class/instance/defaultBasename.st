accessing
defaultBasename
	^ release 
		ifNil: [ 'vm' ]
		ifNotNil: [ 'vm', self release capitalized ]