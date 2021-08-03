sy keyword kspFunc func nextgroup=kspFuncName skipwhite skipempty
sy keyword kspKeyword import
sy keyword kspKeyword public
sy keyword kspKeyword pub
sy keyword kspKeyword var
sy keyword kspAwait await
sy keyword kspAsync async
sy keyword kspKeyword return

sy match  kspType  "\v(String|Number|Char|Promise)" 
sy match  kspPrint "\v<print(ln)?>" nextgroup=kspPrint skipwhite
sy match  kspString '\v"([^"]*)"'   nextgroup=kspString skipwhite
sy match  kspFuncName "\%(k#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
sy match  kspOperator     display "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\|:=\)=\?"

hi def link kspOperator Operator
hi def link kspFuncName Function
hi def link kspFunc Keyword
hi def link kspKeyword Keyword
hi def link kspAwait Keyword
hi def link kspAsync keyword
hi def link kspPrint Function
hi def link kspString String
hi def link kspType Type
