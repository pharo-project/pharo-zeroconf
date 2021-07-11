Temporary script to overcome the migration form single dash "-help" options to double dash "--help" options in the pharo vm.

You can try me with: 
| dir |
dir := FileLocator temp asFileReference.
ZeroConfVMVersionScript pharo40 
	directory: dir;
	generate.
dir