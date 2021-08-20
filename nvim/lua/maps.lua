local vimp = require('vimp')
function nmap(k, c) 
	vimp.nnoremap(k, function() vim.cmd(c) end)
end
nmap("<S-t>"  , ':tabnew') -- new tab
nmap("<S-x>"  , ':bdelete') -- close tab
nmap("<TAB>"  , ':BufferLineCycleNext')
nmap("<S-TAB>", ':BufferLineCyclePrev')
nmap('<C-Q>'  , ':q')
nmap('<C-L>'  , ':ToggleTerminal')
nmap('<C-W>'  , ':w')
nmap('[d'     , ':Lspsaga diagnostic_jump_prev')
nmap(']d'     , ':Lspsaga diagnostic_jump_next')
nmap('<C-P>'  , ':Lspsaga preview_definition')
nmap('<C-[>'  , ':wincmd h')
nmap('<C-]>'  , ':wincmd l')
nmap('<A-[>'  , ':wincmd k')
nmap('<A-]>'  , ':wincmd j')

