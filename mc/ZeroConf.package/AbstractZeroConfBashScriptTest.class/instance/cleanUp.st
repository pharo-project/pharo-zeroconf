helper
cleanUp
	script artifacts do: [ :artifact|
		artifact asFileReference ensureDelete ]