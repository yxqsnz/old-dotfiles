local vim = vim
local vimp = require('vimp')
local opt = {silent = true}
local map = vim.api.nvim_set_keymap
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
vim.cmd[[tnoremap <esc> <C-\><C-n>]]
vimp.nnoremap('<C-q>', function()
	vim.cmd(':q')
end)
vimp.nnoremap('<C-z>', function() 
	vim.cmd(":ToggleTerminal")
end)
vimp.nnoremap('<C-w>', function() 
	vim.cmd(':w')
end)
vimp.nnoremap('[d', function() 
	vim.cmd(':Lspsaga diagnostic_jump_prev')
end)
vimp.nnoremap(']d', function() 
	vim.cmd(':Lspsaga diagnostic_jump_next')
end)
vimp.nnoremap('<C-P>', function()
	vim.cmd(':Lspsaga preview_definition')
end)
