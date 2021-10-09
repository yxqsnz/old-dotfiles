local cmd = vim.cmd
require'nvim-tree'.setup {}
-- local g = vim.g
-- 
-- g.nvim_tree_side = "right"
-- g.nvim_tree_width = 25
-- g.nvim_tree_ignore = {".git", "target", "node_modules", ".cache"}
-- g.nvim_tree_auto_open = 0
-- g.nvim_tree_auto_close = 0
-- g.nvim_tree_quit_on_open = 1
-- g.nvim_tree_follow = 1
-- g.nvim_tree_indent_markers = 1
-- g.nvim_tree_hide_dotfiles = 1
-- g.nvim_tree_git_hl = 1
-- g.nvim_tree_root_folder_modifier = ":~"
-- g.nvim_tree_tab_open = 0
-- g.nvim_tree_allow_resize = 1
-- 
-- g.nvim_tree_show_icons = {
	-- git = 1,
	-- folders = 1,
	-- files = 1
-- }
-- 
-- g.nvim_tree_icons = {
	-- default = " ",
	-- symlink = " ",
	-- git = {
		-- unstaged = "✗",
		-- staged = "✓",
		-- unmerged = "",
		-- renamed = "➜",
		-- untracked = "★"
	-- },
-- }

local get_lua_cb = function(cb_name)
	return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
end

-- Mappings for nvimtree

vim.api.nvim_set_keymap(
	"n",
	"<C-n>",
	":NvimTreeToggle<CR>",
	{
		noremap = true,
		silent = true
	}
)

cmd "hi NvimTreeFolderIcon guifg = #61afef"
cmd "hi NvimTreeFolderName guifg = #61afef"
cmd "hi NvimTreeIndentMarker guifg=#383c44"
