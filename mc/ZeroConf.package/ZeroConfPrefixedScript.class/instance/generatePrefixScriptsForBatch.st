script generation
generatePrefixScriptsForBatch

	self prefixScripts do: [ :script |
		script generateBodyForBatchOn: self outputStream.
		self cr. ].