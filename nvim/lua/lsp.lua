local lsp = require('lspconfig')
local vim, bufnr = vim, bufnr
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
function on_attach(client)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		update_in_insert = true,
	})
end
local servers = {
	gopls =  {
		settings = nil,
		command = nil,
	},
	rust_analyzer = {
		on_attach = on_attach,
		command = { "/home/yxqsnz/.cargo/target/x86_64-unknown-linux-gnu/release/rust-analyzer" },
		settings = {
			["rust-analyzer"] = {
				assist = {
					importGranularity = "module",
					importPrefix = "by_self",
				},
				cargo = {
					loadOutDirsFromCheck = true
				},
				procMacro = {
					enable = true
				},
			}
		}
	},
	-- rls = {
		-- settings = {
			-- rust = {
				-- target = "x86_64-unknown-linux-gnu",
				-- unstable_features = true,
				-- build_on_save = true,
				-- all_features = true,
			-- },
		-- }
	-- },
	
	sumneko_lua =  { 
	},
}
capabilities.textDocument.completion.completionItem.snippetSupport = true

for server, opts in pairs(servers) do
	lsp[server].setup {
		on_attach = on_attach, -- require'completion'.on_attach
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		cmd = opts.command,
		settings = opts.settings
	}
end

require('lspkind').init {
	with_text = true,
	preset = 'default'
}
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})


