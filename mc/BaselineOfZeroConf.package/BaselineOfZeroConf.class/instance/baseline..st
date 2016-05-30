accessing
baseline: spec
	<baseline>
	spec
		for: #pharo
		do: [
			spec
				project: 'CommandShell'
				with: [
					spec
						className: 'ConfigurationOfCommandShell';
						version: #stable;
						repository: 'http://www.squeaksource.com/MetacelloRepository' ].
			spec package: 'ZeroConf'.
			spec package: 'ZeroConf-Tests' with: [ spec requires: #('CommandShell') ].
			spec group: 'all' with: #('ZeroConf' 'ZeroConf-Tests').
			spec group: 'default' with: #('ZeroConf') ]