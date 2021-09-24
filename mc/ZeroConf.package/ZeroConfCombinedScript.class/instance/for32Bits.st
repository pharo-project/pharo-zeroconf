accessing
for32Bits

	| copy |
	copy := super for32Bits.
	copy scripts: (copy scripts collect: [ :subscript | subscript for32Bits ]).
	^ copy