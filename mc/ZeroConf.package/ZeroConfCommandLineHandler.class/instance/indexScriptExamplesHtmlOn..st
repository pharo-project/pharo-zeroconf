accessing
indexScriptExamplesHtmlOn: s 
	s << '<h2>Pharo Example</h2>'; cr;
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

</table>'.