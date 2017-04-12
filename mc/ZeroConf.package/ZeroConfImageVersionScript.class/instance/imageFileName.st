accessing
imageFileName
	^ imageFileName ifNil: [ self class defaultImageFileName ]