local configs = require('lspconfig/configs')
local lsp 	  = require('lspconfig')
local util    = require('lspconfig/util')
local server_name = 'sleeplylyzer'
configs[server_name] = {
  default_config = {
    cmd = { 'sleeplylyzer' },
    cmd_env = {
     GLOB_PATTERN = vim.env.GLOB_PATTERN or '*@(.3bc|._3bc|.tbc)',
    },
    filetypes = { '3bc' },
    root_dir = util.path.dirname,
  },
  docs = {
    description = [[
https://github.com/yxqsnz/sleeplylyzer
Language server for 3bc, written in Rust
]],
    default_config = {
      root_dir = "vim's starting directory",
    },
  },
}
