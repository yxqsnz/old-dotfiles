local opt, bopt, wopt = vim.o, vim.bo, vim.wo
opt.splitbelow = true
opt.wrap, wopt.wrap = false, false
opt.number, wopt.number = true, true
opt.relativenumber, wopt.relativenumber = true, true
opt.mouse = "a"
opt.termguicolors = true
opt.tabstop, bopt.tabstop = 4, 4
opt.shiftwidth, bopt.shiftwidth = 4, 4
opt.expandtab = false
opt.showtabline = 2
opt.termguicolors = true
opt.guicursor = "v-c-sm:block,c-i-ci-ve:ver25,r-cr-o:hor20"
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_spec = 0
vim.g.loaded_syncolor = 0
vim.g.mapleader = ","
vim.g.completion_enable_auto_popup = 1
vim.g.rustfmt_autosave = 1;
vim.g.rainbow_active = 1;
-- vim.cmd[[colorscheme palenight]]
vim.cmd[[command! Term split|term]]
vim.cmd[[command! VTerm belowright vsplit|term]]

local base16 = require('base16')
base16(base16.themes('javacafe'), true)

