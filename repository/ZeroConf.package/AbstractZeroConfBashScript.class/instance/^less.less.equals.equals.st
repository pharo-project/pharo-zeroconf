stream delegating
<<== aString
	"Add aString as bash comment"
	self << '# '; << aString; << ' '.
	(78 - aString size) timesRepeat: [ self << '=' ].
	self cr.