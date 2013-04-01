script generation html
generateHtmlArtifactDescription
	
	| artifactDescription |
	artifactDescription := self artifactDescription.
	
	self << '<table>'.
	artifactDescription keys sorted 
		do: [ :artifact | 
			
			self 
				<< '<tr>'
				<< '<td>' << artifact << '</td>'
				<< '<td>' << (artifactDescription at: artifact) << '</td>'
				<< '</tr>' ]
		separatedBy: [ self cr ].
	
	self << '</table>'