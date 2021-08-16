local vim = vim
vim.cmd [[packadd packer.nvim]]
local plugins = require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'rakr/vim-two-firewatch'
  use "yxqsnz/3bc.vim"
  use "projectfluent/fluent.vim"
  use "akinsho/nvim-toggleterm.lua"
  use "glepnir/lspsaga.nvim"
  use "sainnhe/everforest"
  use "navarasu/onedark.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "svermeulen/vimpeccable"
  use "luochen1990/rainbow"
  use "cespare/vim-toml"
  use "rust-lang/rust.vim"
  use "neovim/nvim-lspconfig"
  use "nvim-treesitter/nvim-treesitter"
  use "onsails/lspkind-nvim"
  use "hrsh7th/nvim-compe"
  use "akinsho/nvim-bufferline.lua"
  use "kyazdani42/nvim-web-devicons"
  use "glepnir/galaxyline.nvim"
  use "andweeb/presence.nvim"
  use "windwp/nvim-autopairs"
  use "kyazdani42/nvim-tree.lua"
  use "lukas-reineke/indent-blankline.nvim"
end)


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
-- vim.cmd[[colorscheme two-firewatch]
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
require[[_3bclsp]]
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
