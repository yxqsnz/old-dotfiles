vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.updatetime = 300
local vimp = require('vimp')
local cmp  = require('cmp')
local lspkind = require('lspkind')
cmp.setup {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			return vim_item
		end
	},
	completion = {
		completeopt = 'menuone,noinsert,noselect',
	},
	documentation = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				    winhighlight = 'FloatBorder:TelescopeBorder',
                },
	sources = {
		{ name = 'nvim_lsp'		},
		{ name = 'path' 		},
		{ name = 'calc' 		},
		{ name = 'emoji' 		},
		{ name = 'speell' 		},
		{ name = 'crates' 		},
		{ name = 'cmp_tabnine'  },
		{ name = 'buffer'		}
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		})
	},
}

-- local cmp = require("cmp")
-- vim.opt.completeopt = "menuone,noselect"
-- cmp.setup {
    -- snippet = {
        -- expand = function(args)
            -- require("luasnip").lsp_expand(args.body)
        -- end,
    -- },
    -- formatting = {
        -- format = function(entry, vim_item)
            -- -- load lspkind icons
            -- vim_item.kind = require('lspkind').presets.default[vim_item.kind]
-- 
            -- vim_item.menu =
                -- ({
                    -- nvim_lsp = "﬘",
                    -- nvim_lua = "",
                    -- buffer = "",
                -- })[entry.source.name]
-- 
            -- return vim_item
        -- end,
    -- },
    -- documentation = {
     					-- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                        -- winhighlight = 'FloatBorder:TelescopeBorder',
                    -- },
                     -- 
    -- mapping = {
        -- ["<C-p>"] = cmp.mapping.select_prev_item(),
        -- ["<C-n>"] = cmp.mapping.select_next_item(),
        -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        -- ['<S-Tab>'] = cmp.mapping.complete(),
        -- ['<C-J>'] = cmp.mapping.complete(),
                    -- 
    -- },
    -- sources = {
        -- { name = "nvim_lsp" },
        -- { name = "luasnip" },
        -- { name = "buffer" },
        -- { name = "nvim_lua" },
    -- },
-- }
