accessing scripts
scripts
	"The base scripts work by looking at the current architecture.
	Generate scripts that explicitly search for the corresponding 32 and 64 bit versions"
	| baseScripts |
	baseScripts := self imageScripts, self vmScripts, self combinedScripts.
	baseScripts := baseScripts, (baseScripts collect: [:script | script for32Bits ]).
	baseScripts := baseScripts, (baseScripts collect: [:script | script for64Bits ]).
	^ baseScripts