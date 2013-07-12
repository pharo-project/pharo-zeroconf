versions
version10: spec
	<version: '1.0' imports: #('1.0-baseline' )>

	spec for: #'common' do: [		
		"Common Authors: AndreiChis CamilloBruni EstebanLorenzano"
		spec
			project: 'CommandShell' with: '1.1';
			package: 'ZeroConf' with: 'ZeroConf-EstebanLorenzano.40'
	].