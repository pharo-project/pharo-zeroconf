versions
version10: spec
	<version: '1.0' imports: #('1.0-baseline' )>

	spec for: #'common' do: [		
		spec
			project: 'CommandShell' with: '1.1';
			package: 'ZeroConf' with: 'ZeroConf-CamilloBruni.25'
	].