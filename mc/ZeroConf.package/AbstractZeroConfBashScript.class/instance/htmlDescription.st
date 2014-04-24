accessing
htmlDescription
	^ self description
		copyReplaceAll: String cr with: '<br/>',String cr 