accessing
additionalHtmlHelp
	^ additionalHtmlHelp ifNil: [
		self additionalHelp 
			copyReplaceAll: String cr with: ('<br/>', String lf);
			copyReplaceAll: String lf with: ('<br/>', String lf) ]