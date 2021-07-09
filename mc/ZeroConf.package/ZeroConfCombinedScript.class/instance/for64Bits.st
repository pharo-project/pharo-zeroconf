accessing
for64Bits

	| copy |
	copy := super for64Bits.
	copy scripts: (copy scripts collect: [ :subscript | subscript for64Bits ]).
	^ copy