script generation html
formattedUrl
	"Return a formatted url where $+ is not urlencoded"
	| pathString |
	^ String streamContents: [ :s|
		self url printAuthorityOn: s.
		"hack to make the $+ appear in the url string".
		pathString := self url pathPrintString urlDecoded.
		"do not print a single /"
		pathString = '/'
			ifFalse: [ s << pathString ]]