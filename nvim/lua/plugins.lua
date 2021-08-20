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
