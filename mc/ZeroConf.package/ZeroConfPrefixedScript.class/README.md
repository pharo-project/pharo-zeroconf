I combine several ZeroConf scripts which are treated as prefix for code generation.
The final script name is not altered by the prefix.

Example:
========
	prefiexedScript := scriptA / scriptB.

Then the output script is in `scriptA basename / scriptB basename, '.sh'` and the final script will have both the contents of `scriptA` and `scriptB`