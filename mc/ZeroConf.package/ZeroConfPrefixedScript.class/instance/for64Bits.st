combining
for64Bits

	| copy |
	copy := super for64Bits.
	copy prefixScripts: (copy prefixScripts collect: [ :subscript | subscript for64Bits ]).
	^ copy