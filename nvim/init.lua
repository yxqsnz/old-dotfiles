
local ok, err = pcall(function() require('plugins') end)
if not ok then
	print(err)
end
local ok, err = pcall(
function()
	
	require('maps')
	require('tabline')
	require('settings')
	require('highlight')
	require('statusline')		
	require('treesitter')
	require('indentation')
	require('file-manager')

	-- completion
	require('cmp-config')
	require('rs-tools')
	require('lsp')
		
	end
)
if not ok then
	print(err)
	vim.cmd(':PackerSync')
end
--[
-- neovide configuration	
--]
vim.cmd([[:set guifont=JetBrains\ Mono:h12]])
