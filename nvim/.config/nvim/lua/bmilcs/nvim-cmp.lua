-----------------------------------------------------------
-- Cmp configuration file
----------------------------------------------------------

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end

local kind_icons = {
	Text = "",
	Method = "",
	Function = "ƒ",
	Constructor = " ",
	Field = "識",
	Variable = "",
	Class = " ",
	Interface = "ﰮ",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = " ",
	File = " ",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "鬒",
	Operator = "",
	TypeParameter = "",
}

-- load snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	-- Load snippet support
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	-- Completion settings
	completion = {
		keyword_length = 2,
	},

	-- Key mapping
	mapping = {
		["<Tab>"] = cmp.mapping.select_next_item(), -- scroll using tab
		["<S-Tab>"] = cmp.mapping.select_prev_item(), -- scroll using s-tab
		["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll docs
		["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll docs
		["<C-Space>"] = cmp.mapping.complete(), -- show using <C-space>
		["\\"] = cmp.mapping.close(), -- close using \
		["<CR>"] = cmp.mapping.confirm({ -- using enter to pick
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = "[lsp]",
				nvim_lua = "[nvim_lua]",
				luasnip = "[snippet]",
				buffer = "[buffer]",
				path = "[path]",
			})[entry.source.name]
			return vim_item
		end,
	},

	-- add sources here; move priorities higher
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
	},
})
