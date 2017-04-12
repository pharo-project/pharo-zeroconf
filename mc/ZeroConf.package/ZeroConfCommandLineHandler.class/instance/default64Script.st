accessing scripts 64
default64Script
	^ (ZeroConfImageVersionScript pharo: self class stable64Version) be64bits, 
	  (ZeroConfVMVersionScript pharo: self class stable64Version status: #stable) be64bits