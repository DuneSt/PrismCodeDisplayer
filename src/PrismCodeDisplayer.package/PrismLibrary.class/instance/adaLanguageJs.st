languages highlights
adaLanguageJs
	^ 'Prism.languages.ada = {comment:/--.*/,
string:/(["''])(\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,
keyword:/\b(abort|else|new|return|abs|elsif|not|reverse|abstract|end|null|accept|entry|select|access|exception|of|separate|aliased|exit|or|some|all|others|subtype|and|for|out|synchronized|array|function|overriding|at|tagged|generic|package|task|begin|goto|pragma|terminate|body|private|then|if|procedure|type|case|in|protected|constant|interface|until|is|raise|use|declare|range|delay|limited|record|when|delta|loop|rem|while|digits|renames|with|do|mod|requeue|xor)\b/,
number:/\b-?(?:0x[\da-f]+|\d*\.?\d+(?:e[+-]?\d+)?)\b/i,
punctuation:/[{}[\];(),.:]/,
variable:/[@$|<>]+[a-zA-Z_À-ÿ][a-zA-Z_0-9À-ÿ]*(?:[?!]|\b)/i,
operator:/--?|\+\+?|!=?=?|<=?|>=?|==?=?|&&?|\|\|?|\?|\*|\/|~|\^|%/,
boolean:/\b(?:True|False)\b/i
}'