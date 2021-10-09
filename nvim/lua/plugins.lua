vim.cmd [[packadd packer.nvim]]
local plugins = require('packer').startup(function()
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"f3fora/cmp-spell"
		}
	}
	use 'nvim-lua/completion-nvim'
	use 'peterhoeg/vim-qml'
	use { 'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp' }
	use { 'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	use 'wbthomason/packer.nvim'
	use 'rakr/vim-two-firewatch'
	use "yxqsnz/3bc.vim"
	use "projectfluent/fluent.vim"
	use "akinsho/nvim-toggleterm.lua"
	use "glepnir/lspsaga.nvim"
	use "sainnhe/everforest"
	use "norcalli/nvim-colorizer.lua"
	use "svermeulen/vimpeccable"
	use "luochen1990/rainbow"
	use "cespare/vim-toml"
	use "rust-lang/rust.vim"
	use "neovim/nvim-lspconfig"
	use "nvim-treesitter/nvim-treesitter"
	use "onsails/lspkind-nvim"
	use "akinsho/nvim-bufferline.lua"
	use "kyazdani42/nvim-web-devicons"
	use "glepnir/galaxyline.nvim"
	use "andweeb/presence.nvim"
	use "windwp/nvim-autopairs"
	use "kyazdani42/nvim-tree.lua"
	use "lukas-reineke/indent-blankline.nvim"
	use "dunstontc/vim-vscode-theme"
	use "rhysd/vim-clang-format"
	use "NvChad/nvim-base16.lua"
	use "simrat39/rust-tools.nvim"
	use "glepnir/dashboard-nvim"
	use "nvim-telescope/telescope.nvim"
	use "liuchengxu/vim-clap"
end)
vim.opt.termguicolors = true
require[[nvim-autopairs]].setup()
require[[colorizer]].setup()

