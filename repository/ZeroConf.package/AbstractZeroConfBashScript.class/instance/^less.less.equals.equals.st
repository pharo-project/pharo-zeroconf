stream delegating
<<== aString
	self << '# '; << aString; << ' '.
	(78 - aString size) timesRepeat: [ self << '=' ].
	self cr.