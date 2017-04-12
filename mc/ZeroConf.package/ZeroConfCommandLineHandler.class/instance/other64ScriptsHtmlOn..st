accessing
other64ScriptsHtmlOn: stream
	stream
		<< '<h2>Other Scripts</h2>'; cr;
		<< '<table>'.
	self scripts64
		do: [ :script| 
			stream << '<tr>';
				<< '<td><code><a href="'; print: script url; << '">'; << script formattedUrl; << '</a></code></td>';
				<< '<td>'; << script description; << '</td>';
				<< '<tr>' ]
		separatedBy: [ stream cr ].
	stream << '</table>'