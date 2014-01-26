script generation
generatePrefixScripts

	self prefixScripts do: [ :script |
		script generateBodyOn: self outputStream.
		self cr. ].