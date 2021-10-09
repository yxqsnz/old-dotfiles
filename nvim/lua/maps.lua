local vimp = require('vimp')
function nmap(k, c) 
	vimp.nnoremap(k, function() vim.cmd(c) end)
end
nmap("<S-t>"  , ':tabnew') -- new tab
nmap("<S-x>"  , ':bdelete') -- close tab
nmap("<TAB>"  , ':BufferLineCycleNext')
nmap("<S-TAB>", ':BufferLineCyclePrev')
nmap('<C-Q>'  , ':q')
--nmap('<C-L>'  , ':ToggleTerminal')
nmap('<C-W>'  , ':w')
nmap('[d'     , ':Lspsaga diagnostic_jump_prev')
nmap(']d'     , ':Lspsaga diagnostic_jump_next')
nmap('<C-P>'  , ':Lspsaga preview_definition')
nmap('<C-R>'  , ':Lspsaga rename')
nmap('<C-A>'  , ':Lspsaga code_action')
nmap('<C-[>'  , ':wincmd h')
nmap('<C-]>'  , ':wincmd l')
nmap('<A-[>'  , ':wincmd k')
nmap('<A-]>'  , ':wincmd j')
nmap('gd'     , ':lua vim.lsp.buf.definition()')
nmap('cl'     , ':lua vim.lsp.buf.declaration()')

