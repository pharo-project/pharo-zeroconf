accessing scripts 64
index64Script
	"the index.html is a special script that downloads the current stable release of Pharo with the VM.
	Additionally it has a complete list of exported scripts in the html help"
	| indexScript |
	indexScript := self default64Script. 
	indexScript additionalHtmlHelp: (String streamContents: [ :s |
		self indexScriptExamplesHtmlOn: s.
		self other64ScriptsHtmlOn: s ] ).
	indexScript 
		basename: 'index.html';
		url: (indexScript baseUrl addPathSegment: self class subdir64).
	^ indexScript.