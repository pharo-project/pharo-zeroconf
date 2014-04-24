accessing
artifactDescription
	| artifactDescription |
	artifactDescription := Dictionary new.
	self scripts do: [  :script |
		script artifactDescription keysAndValuesDo: [ :artifact :description | 
			artifactDescription 
				at: artifact 
				ifPresent: [ Error signal: 'Subscripts cannot generate the same artifact: ', artifact ].
				artifactDescription 	at: artifact put: description.
			]].
	
 	^ artifactDescription