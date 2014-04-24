script generation
generateBody
	self <<== 'INSTALL REQUIREMENTS'.
	self 
		<< 'sudo add-apt-repository ppa:pharo/stable'; lf;
		<< 'sudo apt-get update'; lf;
		<< 'sudo apt-get install pharo-vm-core:i386'; lf.