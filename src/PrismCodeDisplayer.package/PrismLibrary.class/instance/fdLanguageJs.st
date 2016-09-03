uploaded
fdLanguageJs
	^ 'Prism.languages.fourD = {comment:[{pattern:/(^|[^\\])\/\*[\w\W]*?\*\//,lookbehind:!0},{pattern:/(^|[^\\:])\/\/.*/,lookbehind:!0}],
string:/(["''])(\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,
keyword:/\b(If|Else|End if|Case of|End case|While|End while|Repeat|Until|For|End for|Si|Sinon|Fin de si|Au cas ou|Fin de cas|Tant que|Fin tant que|Repeter|Jusque|Boucle|Fin de boucle)\b/,
number:/\b-?(?:0x[\da-f]+|\d*\.?\d+(?:e[+-]?\d+)?)\b/i,
punctuation:/[{}[\];(),.:]/,
variable:/[@$|<>]+[a-zA-Z_À-ÿ][a-zA-Z_0-9À-ÿ]*(?:[?!]|\b)/i,
operator:/--?|\+\+?|!=?=?|<=?|>=?|==?=?|&&?|\|\|?|\?|\*|\/|~|\^|%/,
boolean:/\b(?:True|False|Vrai|Faux)\b/i
}'