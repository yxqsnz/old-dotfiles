local vim = vim
-- plugins
require[[paq]] {
	-- paq
	"savq/paq-nvim",
	-- fluent
	"projectfluent/fluent.vim", 
	-- terminal
	"akinsho/nvim-toggleterm.lua",
	-- saga
	"glepnir/lspsaga.nvim",
	-- colors
	"sainnhe/everforest",
	"navarasu/onedark.nvim",
	"norcalli/nvim-colorizer.lua",
	-- some settings
	"svermeulen/vimpeccable",
	-- RAINBOW BRACKETS!!
	"luochen1990/rainbow",
	-- syntax
	"adelarsq/neofsharp.vim",
    	"cespare/vim-toml",
	"rust-lang/rust.vim",
	-- lsp
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",
	"onsails/lspkind-nvim",
	"hrsh7th/nvim-compe",

	-- tabline/statusline
	"akinsho/nvim-bufferline.lua",
	"kyazdani42/nvim-web-devicons",
	"glepnir/galaxyline.nvim",
	-- others
	"andweeb/presence.nvim", -- discord
	"windwp/nvim-autopairs", -- auto open and close pairs
	"kyazdani42/nvim-tree.lua", -- file manager
	"lukas-reineke/indent-blankline.nvim", -- ident guides
}

-- Disable Default Vim Plugins
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_spec = 0
vim.g.loaded_syncolor = 0
vim.g.nvim_tree_side = 'left'
-- options
local opt, bopt, wopt = vim.o, vim.bo, vim.wo
opt.splitbelow = true
opt.wrap, wopt.wrap = false, false
opt.number, wopt.number = true, true
opt.relativenumber, wopt.relativenumber = true, true
opt.mouse = "a"
opt.tabstop, bopt.tabstop = 4, 4
opt.shiftwidth, bopt.shiftwidth = 4, 4
opt.expandtab = false
opt.showtabline = 2
opt.termguicolors = true
opt.guicursor = "v-c-sm:block,c-i-ci-ve:ver25,r-cr-o:hor20"

-- plugins that doesn't need configuration requires
require[[nvim-autopairs]].setup()
require[[colorizer]].setup()
local vimp = require('vimp')
vim.cmd[[colorscheme palenight]]
vim.cmd[[command! Term split|term]]
vim.cmd[[command! VTerm belowright vsplit|term]]
vim.g.rustfmt_autosave = 1;
vim.g.rainbow_active = 1;
vimp.nnoremap('<C-q>', function()
	vim.cmd(':q')
end)
vimp.nnoremap('<C-z>', function() 
	vim.cmd(":ToggleTerminal")
end)
vimp.nnoremap('<C-w>', function() 
	vim.cmd(':w')
end)
-- lua files requires
require[[lsp]]
require[[tabline]]
require[[treesitter]]
require[[highlight]]
require[[compe-completion]]
require[[nvimtree]]
require[[statusline]]
require[[maps]]
require[[indentation]]
require[[saga]]
require("toggleterm").setup {
	open_mapping = [[<C-l>]],
}
