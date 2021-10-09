sy keyword nuFunction def nextgroup=nuFunctionName skipwhite skipempty
sy keyword Function echo 
sy keyword Function curl
sy keyword Function mkdir
sy keyword Function str
sy keyword nuCond if else 
sy keyword nuKeyword let nextgroup=NuFunctionName skipwhite skipempty
sy keyword nuType int string path table unit number pattern range block any
sy match   nuNumber "[0-9-\.]" nextgroup=nuNumber skipwhite
sy match   Function "\v([A-z-0-9]*){2,} "
sy match   nuString '\v"([^"]*)"'   nextgroup=nuString skipwhite
sy match   nuFunctionName "\%(n#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
sy match   nuVar "$\h\w*" nextgroup=nuVar skipwhite
sy match   nuOperator "\v\%|\.\.|\+|\=|\-|\*|\/" nextgroup=nuOperator skipwhite
sy match   nuComment "\v\#.*" nextgroup=nuComment skipwhite

hi def link nuCond         Conditional
hi def link nuFunctionName Function
hi def link nuKeyword  	   Keyword
hi def link nuFunction 	   Keyword
hi def link nuType     	   Type
hi def link nuString   	   String
hi def link nuChar     	   Char
hi def link nuNumber  	   Number
hi def link nuVar      	   Identifier
hi def link nuOperator     Operator
hi def link nuComment      Comment
