script generation
generateVmScriptCreator
	self 
		<<== 'CREATE THE VM LAUNCHER SCRIPTS'
		<< ('create_vm_script() \{
	VM_SCRIPT=$1
	
	echo "#!/usr/bin/env bash" > $VM_SCRIPT
	echo ''# some magic to find out the real location of this script dealing with symlinks
DIR=`readlink "$0"` || DIR="$0";
DIR=`dirname "$DIR"`;
cd "$DIR"
DIR=`pwd`
cd - > /dev/null 
# disable parameter expansion to forward all arguments unprocessed to the VM
set -f
# run the VM and pass along all arguments as is'' >> $VM_SCRIPT
	
	# make sure we only substite $PHARO_VM but put "$DIR" in the script
	echo -n \\"\\$DIR\\"/\\"$PHARO_VM\\" >> $VM_SCRIPT
	
	# only output the headless option if the VM_SCRIPT name does not include "ui"
	if [[ "\{$VM_SCRIPT}" != *ui* ]]; then
		# output the headless option, which varies under each platform
		if [ "$OS" == "linux" ]; then
		    echo -n " {1}nodisplay " >> $VM_SCRIPT
		else
		    echo -n " {1}headless" >> $VM_SCRIPT
		fi
	fi
	
	# forward all arguments unprocessed using $@
	echo " \\"\\$@\\"" >> $VM_SCRIPT
	
	# make the script executable
	chmod +x $VM_SCRIPT
}

echoerr "Creating starter scripts {2} and {2}-ui"
create_vm_script "{2}"
create_vm_script "{2}-ui"' format: {self optionDash. self type}); cr