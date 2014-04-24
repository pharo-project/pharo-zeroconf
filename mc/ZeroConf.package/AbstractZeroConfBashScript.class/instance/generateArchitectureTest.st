script generation
generateArchitectureTest
	self << 'if [ -z "$ARCHITECTURE" ] ; then
    ARCHITECTURE=32;
fi'; cr