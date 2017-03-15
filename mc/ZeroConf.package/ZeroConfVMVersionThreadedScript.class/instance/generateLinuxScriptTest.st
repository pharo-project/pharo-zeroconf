script generation
generateLinuxScriptTest
	super generateLinuxScriptTest.
	self 
		<<== 'REMEMBER ULIMITS REQUIREMENTS'
		<< 'echo "This VM uses a thread heartbeat who requires a special configuration to work."'; cr; 
		<< 'echo "Remember to run ./CONFIG once, before using pharo."'; cr; 
		<< 'echo "sudo cat >/etc/security/limits.d/pharo.conf <<END'; cr; 
		<< '*       hard    rtprio  2'; cr; 
		<< '*       soft    rtprio  2'; cr; 
		<< 'END" > ./CONFIG'; cr;
		<< 'chmod +x ./CONFIG'; cr;
		cr.