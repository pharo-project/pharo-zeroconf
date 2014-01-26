stream delegating
<<== aString
	"Add aString as separator to the output script, the following line would be the output of `self <<== 'foo'`:
	# foo =========================================================================== "
	
	self << '# '; << aString; << ' '.
	(78 - aString size) timesRepeat: [ self << '=' ].
	self cr.