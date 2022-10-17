-----------------------------------------------------------
-- Mini Completion configuration file
----------------------------------------------------------

local status_completion, mini_completion = pcall(require, "mini.completion")
if not status_completion then
	return
end

mini_completion.setup({
	source_func = "omnifunc",
	auto_setup = false,
})

vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
