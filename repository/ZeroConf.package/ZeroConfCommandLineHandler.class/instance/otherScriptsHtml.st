accessing
otherScriptsHtml
	^ (String streamContents: [ :s |
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
		]) 