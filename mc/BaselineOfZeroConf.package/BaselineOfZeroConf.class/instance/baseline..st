accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		spec repository: 'filetree://repository/mc'. 
		
		self commandShell: spec.
		
		spec 
			package: 'ZeroConf';
			package: 'ZeroConf-Tests' ]	