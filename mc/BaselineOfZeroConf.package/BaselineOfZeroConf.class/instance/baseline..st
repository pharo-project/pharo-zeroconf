accessing
"protocol: accessing"
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		self commandShell: spec.
		
		spec package: 'ZeroConf'.
		spec package: 'ZeroConf-Tests' with: [ spec requires: #('CommandShell') ].
		
		spec group: 'all' with: #('ZeroConf' 'ZeroConf-Tests').
		spec group: 'default' with: #('ZeroConf') ]	