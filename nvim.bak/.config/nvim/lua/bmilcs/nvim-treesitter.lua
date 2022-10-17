-----------------------------------------------------------
-- Nvim Treesitter configuration file
----------------------------------------------------------

local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

nvim_treesitter.setup({
	ensure_installed = {
    "html",
		"css",
		"javascript",
		"typescript",
		"json",
    "markdown",
    "markdown_inline",
		"comment",
		"lua",
		"vim",
		"python",
	},
	sync_install = true,
	highlight = {
		enable = true, -- enable extension
		additional_vim_regex_highlighting = true,
	},
	auto_install = true, -- auto install when missing parsers
	indent = {
		enable = true, -- indent based on treesitter
		disable = { "" }, -- disable treesitter indent for these langs
	},
	fold = {
		fold_one_line_after = true,
	},
	-- Comment settings
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
