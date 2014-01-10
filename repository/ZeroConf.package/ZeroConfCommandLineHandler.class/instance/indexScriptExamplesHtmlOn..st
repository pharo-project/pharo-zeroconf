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

<tr>
<td>Install a configuration from the command line: </td>
<td>
	<pre>./pharo Pharo.image config \
          http://smalltalkhub.com/mc/Pharo/ZeroConf/main \
          ConfigurationOfZeroconf \
          --install=development</pre>
</tr>
</table>'.