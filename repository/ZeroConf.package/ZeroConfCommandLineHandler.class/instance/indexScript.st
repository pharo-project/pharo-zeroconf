accessing
indexScript
	"the index.html is a special script that downloads the current stable release of Pharo with the VM.
	Additionally it has a complete list of exported scripts in the html help"
	| indexScript |
	indexScript := self defaultScript. 
	indexScript additionalHtmlHelp: (String streamContents: [ :s |
			s 
				<< '<h2>Pharo Example</h2>'; cr;
				<< '<table>

<tr>
<td>Show the command line help:</td>
<td><code>./pharo Pharo.image --help</code></td>
</tr>

<tr>			
<td>List all command line handlers:</td>
<td><code>./pharo Pharo.image --list</code></td>
</tr>

<tr>			
<td>Evaluate an expression on the command line:</td>
<td><code>./pharo Pharo.image eval "Class allInstances"</code></td>
</tr>

<tr>
<td>Install a configuration from the command line: </td>
<td>
	<pre>./pharo Pharo.image config \
          http://smalltalkhub.com/mc/Pharo/ZeroConf/main \
          ConfigurationOfZeroconf \
          --install=development</pre>
</tr>
</table>'.
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