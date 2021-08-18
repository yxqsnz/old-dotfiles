local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
	ensure_installed = {
		"javascript",
		"rust",
		"c",
		"html",
		"css",
		"bash",
		"lua",
		"json",
		"python",
		"go"
	},
	highlight = {
		enable = true,
		use_languagetree = true
	}
}
