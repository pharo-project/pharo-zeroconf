accessing
indexScript
	"the index.html is a special script that downloads the current stable release of Pharo with the VM.
	Additionally it has a complete list of exported scripts in the html help"
	| indexScript |
	indexScript := self defaultScript. 
	indexScript additionalHtmlHelp: (String streamContents: [ :s |
			s 
				<< '<h2>Other Scripts</h2>'; cr;
				<< '<table>'.
			self scripts 
				do: [ :script| 
					s << '<tr>';
						<< '<td><code><a href="'; print: script url; << '">'; << script formattedUrl; << '</a></code></td>';
						<< '<td>'; << script description; << '</td>';
						<< '<tr>' ]
				separatedBy: [ s cr ].
			self << '</table>'
		]).
	indexScript 
		basename: 'index.html';
		url: indexScript baseUrl.
	^ indexScript.