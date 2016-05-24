accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		spec repository: 'filetree://repository/mc'. 
		
		self commandShell: spec.
		
		spec package: 'ZeroConf'.
		spec package: 'ZeroConf-Tests' with: [ spec requires: #('CommandShell') ].
		
		spec group: 'all' with: #('ZeroConf' 'ZeroConf-Tests').
		spec group: 'default' with: #('ZeroConf') ]	