accessing
otherScriptsHtmlOn: stream
	stream
		<< '<h2>Other Versions</h2>'; cr;
		<< '<table>'.
	stream
		<< '<tr>';
		<< '<td>Other versions are available in the form, where version=90,80,70...</td>';
		<< '<td><code>curl https://get.pharo.org/[version]+vm | bash</code></td>';
		<< '</tr><tr>';
		<< '<td>Getting explicitly a 64bit or 32 bit version requires the 32 or 64 prefix</td>';
		<< '<td><code>curl https://get.pharo.org/[32/64]/[version]+vm | bash</code></td>';
		<< '</tr><tr>';
		<< '<td>Older versions can be found at</td>';
		<< '<td><a href="https://get.pharo.org/archive/80">https://get.pharo.org/archive/80</a></td>';
		<< '</tr>'.
	stream << '</table>'