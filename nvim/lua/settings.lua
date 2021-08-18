-- vim:fdm=marker
local lsp           = require('lspconfig')
local bufferline    = require('bufferline')
local colorizer     = require('colorizer')
local saga          = require('lspsaga')
local treesitter    = require('nvim-treesitter.configs')
local galaxyline    = require('galaxyline')
local bufferline    = require('bufferline')
local completion    = require('compe')
local galaxysection = galaxyline.section
local cmd           = vim.cmd
local g             = vim.g
local vim, bufnr    = vim, bufnr

--- functions {{{
local function on_attach(client)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	--vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	--	virtual_text = false,
	--	signs = true,
	--	update_in_insert = true,
	--})

	-- Mappings.
	local opts = {noremap = true, silent = true}

	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- Set some keybinds conditional on server capabilities
	--if client.resolved_capabilities.document_formatting then
	--	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	--elseif client.resolved_capabilities.document_range_formatting then
	--	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	--end
end
--}}}
-- tups wiith no configuration {{{
colorizer.setup()
saga.init_lsp_saga()
-- }}}
-- lsp {{{
local servers = {
	tsserver = "tsserver",
	rust_analyzer = "rust-analyzer",
	sumneko_lua = "lua-lsp"
}
for server, command in pairs(servers) do
	lsp[server].setup {
		on_attach = on_attach,
		root_dir = vim.loop.cwd,
		cmd = { command }
	}
end
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

-- }}}i
-- Completion {{{
completion.setup {
	enabled = true,
	config = {},
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = false,
	source = {
		path = true,
		buffer = {kind = "﬘", true},
		calc = true,
		vsnip = {kind = "﬌"}, --replace to what sign you prefer
		nvim_lsp = true,
		nvim_lua = true,
		spell = true,
		tags = true,
		snippets_nvim = true,
		treesitter = true
	}
}

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

-- tab completion

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	elseif check_back_space() then
		return t "<Tab>"
	else
		return vim.fn["compe#complete"]()
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-p>"
	elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
		return t "<Plug>(vsnip-jump-prev)"
	else
		return t "<S-Tab>"
	end
end

--  mappings

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

function _G.completions()
	local npairs = require("nvim-autopairs")
	if vim.fn.pumvisible() == 1 then
		if vim.fn.complete_info()["selected"] ~= -1 then
			return vim.fn["compe#confirm"]("<CR>")
		end
	end
	return npairs.check_break_line_char()
end

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completions()", {expr = true})

local g = vim.g

-- speeden up compe
g.loaded_compe_calc = 0
g.loaded_compe_emoji = 0

g.loaded_compe_luasnip = 0
g.loaded_compe_nvim_lua = 0

g.loaded_compe_path = 0
g.loaded_compe_spell = 0
g.loaded_compe_tags = 0
g.loaded_compe_treesitter = 0

g.loaded_compe_snippets_nvim = 0

g.loaded_compe_ultisnips = 0
g.loaded_compe_vim_lsc = 0
g.loaded_compe_vim_lsp = 0
g.loaded_compe_omni = 0

-- }}}
-- TreeiSitter {{{
treesitter.setup {
	ensure_installed = {
		"javascript",
		"html",
		"css",
		"bash",
		"lua",
		"json",
		"python",
    "yaml",
    "toml",
    "c",
    "rust"
	},
	highlight = {
		enable = true,
		use_languagetree = true
	}
}

-- }}}
-- GalaxyLine {{{
galaxyline.short_line_list = { "NvimTree", "packer" } -- keeping this table { } as empty will show inactive statuslines

local function checkwidth()
	local squeeze_width = vim.fn.winwidth(0) / 2
	if squeeze_width > 40 then
		return true
	end
	return false
end
-- }}}i
-- Colors {{{i
local colors = {
	purple = '#5752ca',
	bg = '#0b0e1b',
	fg = '#abb2bf',
	green = "#BBE67E",
	orange = "#BF4836",
	red = '#cf2340',
	lightbg = '#141227',
	blue = '#527adc',
	greenYel = "#EBCB8B",
	yellow = "#ffcb6b",
}
-- }}}
-- Left galaxyline {{{i
galaxysection.left[1] = {
	leftRounded = {
		provider = function()
			return "  "
		end,
		highlight = {colors.bg, colors.bg}
	}
}

galaxysection.left[2] = {
	FileIcon = {
		provider = "FileIcon",
		highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg},
	}
}

galaxysection.left[3] = {
	RoundedSymbol = {
		provider = function()
			return ""
		end,
		separator = " ",
		highlight = { colors.bg, colors.lightbg },
		separator_highlight = { colors.lightbg, colors.lightbg }
	}
}

galaxysection.left[4] = {
	GetLspProvider = {
		condition = function()
			return checkwidth and require('galaxyline.provider_lsp').get_lsp_client() ~= "No Active Lsp"
		end,
		provider = "GetLspClient",
		icon = " ",
		highlight = { colors.fg, colors.lightbg }
	}
}

galaxysection.left[5] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "   ",
		highlight = {colors.red, colors.lightbg}
	}
}

galaxysection.left[6] = {
	Space = {
		provider = function()
			return " "
		end,
		highlight = {colors.lightbg, colors.lightbg}
	}
}

galaxysection.left[7] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "  ",
		highlight = {colors.yellow, colors.lightbg},
		separator = " ",
		separator_highlight = { colors.bg, colors.lightbg },
	}
}

galaxysection.left[8] = {
	rightNearEnd = {
		provider = function()
			return ""
		end,
		highlight = { colors.bg, colors.lightbg },
	}
}

galaxysection.left[9] = {
	RightEnd = {
		provider = function()
			return ""
		end,
		highlight = { colors.bg, colors.bg },
	}
}

galaxysection.left[10] = {
	CurrentTime = {
		condition = checkwidth,
		provider = function()
			return vim.fn.strftime('%T') .. " "
		end,
		highlight = {colors.greenYel, colors.bg},
	}
}

galaxysection.left[11] = {
	MidSeparator = {
		provider = function()
			return " "
		end,
		highlight = {colors.bg, colors.lightbg},
	}
}

galaxysection.left[12] = {
	FileName = {
		condition = checkwidth,
		provider = {"FileName", "FileSize"},
		highlight = {colors.fg, colors.lightbg, "italic"}
	}
}

galaxysection.left[13] = {
	OtherSeparator = {
		provider = function()
			return ""
		end,
		highlight = {colors.lightbg, colors.bg}
	}
}
-- Right galaxyline {{{
galaxysection.right[1] = {
	GitIcon = {
		provider = function()
			return " "
		end,
		condition = require("galaxyline.provider_vcs").check_git_workspace,
		highlight = {colors.green, colors.bg},
		separator = " ",
		separator_highlight = { colors.bg, colors.bg }
	}
}

galaxysection.right[2] = {
	GitBranch = {
		provider = "GitBranch",
		condition = require("galaxyline.provider_vcs").check_git_workspace,
		highlight = {colors.green, colors.bg}
	}
}

galaxysection.right[3] = {
	right_LeftRounded = {
		provider = function()
			return " "
		end,
		separator = " ",
		separator_highlight = {colors.bg, colors.bg},
		highlight = {colors.red, colors.bg}
	}
}

galaxysection.right[4] = {
	ViMode = {
		provider = function()
			local mode = vim.fn.mode()

			local alias = {
				n = "NORMAL",
				i = "INSERT",
				c = "COMMAND",
				V = "VISUAL/LINE",
				[""] = "VISUAL/BLOCK",
				v = "VISUAL",
				R = "REPLACE",
				t = "TERM"
			}

			local mode_color = {
				n = colors.fg,
				i = colors.blue,
				c = colors.fg,
				V = colors.purple,
				[""] = colors.purple,
				v = colors.purple,
				R = colors.orange,
				t = colors.fg
			}
			local color = mode_color[mode]

			if color ~= nil then
				vim.cmd("hi! GalaxyViMode guibg="..color)
				vim.cmd("hi! GalaxyIcon guifg="..color)
				vim.cmd("hi! Galaxyright_LeftRounded guifg="..color)
				return " " ..alias[mode]
			end
			return " "
		end,
		highlight = {colors.bg, colors.red},

		separator = "",
		separator_highlight = { colors.bg, colors.bg }
	}
}

galaxysection.right[5] = {
	Icon = {
		provider = function()
			return " "
		end,
		highlight = {colors.red, colors.bg},
	}
}

-- }}}
-- Bufferline {{{
local bar_fg = "#565c64"
local bar_bg = '#121622'
local selected_bgfg = '#171b27'
local activeBuffer_fg = "#c8ccd4"
bufferline.setup {
    options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, _)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {{filetype = "NvimTree", text = "Explorer"}},
		buffer_close_icon = "",
		modified_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		view = "multiwindow",
		show_close_icon = false,
		show_buffer_close_icons = true,
		separator_style = "thick",
		mappings = "true",
		sort_by = "extension"
	},
	-- bar colors!!
	highlights = {
		fill = {
			guifg = bar_fg,
			guibg = bar_bg
		},
		background = {
			guifg = bar_fg,
			guibg = bar_bg
		},
		-- buffer
		buffer_selected = {
			guifg = activeBuffer_fg,
			guibg = selected_bgfg,
			gui = "bold"
		},
		buffer_visible = {
			guifg = "#9298a0",
			guibg = bar_bg
		},
		-- buffer separators
		separator = {
			guifg = bar_bg,
			guibg = bar_bg
		},
		separator_selected = {
			guifg = selected_bgfg,
			guibg = selected_bgfg
		},
		separator_visible = {
			guifg = bar_bg,
			guibg = bar_bg
		},
		indicator_selected = {
			guifg = bar_bg,
			guibg = bar_bg
		},
		-- modified files (but not saved)
		modified_selected = {
			guifg = "#A3BE8C",
			guibg = selected_bgfg
		},
		modified_visible = {
			guifg = "#BF616A",
			guibg = "#23272f"
		}
	}
}
-- }}}
