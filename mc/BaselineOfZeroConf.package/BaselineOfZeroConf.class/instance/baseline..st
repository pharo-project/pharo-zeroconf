accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		self osSubprocess: spec.
		
		spec package: 'ZeroConf'.
		spec package: 'ZeroConf-Tests' with: [ spec requires: #('OSSubprocess') ].
		
		spec group: 'all' with: #('ZeroConf' 'ZeroConf-Tests').
		spec group: 'default' with: #('all') ]	