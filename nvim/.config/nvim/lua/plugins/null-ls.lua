-----------------------------------------------------------
-- Null-ls (Formatter) configuration file
----------------------------------------------------------

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier, -- prettier
		diagnostics.eslint, -- eslint
		diagnostics.jsonlint, -- json
		formatting.rustywind, -- tailwind
		formatting.stylua, -- lua
		completion.spell.with({
			filetypes = { "markdown", "gitcommit" },
		}),
	},
})
