baselines
baseline10: spec
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ZeroConf/main/'.
		spec package: 'ZeroConf'.
		
		self commandShell: spec.
	].