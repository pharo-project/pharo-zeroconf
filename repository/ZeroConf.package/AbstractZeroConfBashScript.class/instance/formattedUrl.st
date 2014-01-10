script generation html
formattedUrl
	"Return a formatted url where $+ is not urlencoded"
	| pathString |
	^ String streamContents: [ :s|
		self url printAuthorityOn: s.
		pathString := self url pathPrintString.
		"do not print a single /"
		pathString = '/'
			ifFalse: [ s << pathString ]]