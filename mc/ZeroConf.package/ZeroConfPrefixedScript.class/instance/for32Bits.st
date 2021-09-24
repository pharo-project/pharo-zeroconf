combining
for32Bits

	| copy |
	copy := super for32Bits.
	copy prefixScripts: (copy prefixScripts collect: [ :subscript | subscript for32Bits ]).
	^ copy