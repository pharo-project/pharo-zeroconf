accessing
indexScript
	"the index.html is a special script that downloads the current stable release of Pharo with the VM.
	Additionally it has a complete list of exported scripts in the html help"
	| indexScript |
	indexScript := self defaultScript. 
	indexScript additionalHtmlHelp: (String streamContents: [ :s |
			s 
				<< self indexScriptExamplesHtml 
				<< self otherScriptsHtml ] ).
	indexScript 
		basename: 'index.html';
		url: indexScript baseUrl.
	^ indexScript.