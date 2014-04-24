script generation html
generateHtmlStyle
	self << '
	BODY, TABLE { 
		font-family: Arial;
		line-height: 1.5em;
	}
	BODY { 
		background-color: white;
		margin-top: -1.5em;
	}
	TD { 
		vertical-align: top;
		padding: 0 1ex 0 0;
	}
	PRE, CODE { 
		background-color: #EEE;
		padding: 0.5ex 0.8ex;
		border-radius: 0.5ex;
	}
	A { 
		color: black;
	}
	'