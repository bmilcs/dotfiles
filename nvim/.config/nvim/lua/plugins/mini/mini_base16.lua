-----------------------------------------------------------
-- Mini BAse16 configuration file
----------------------------------------------------------

local status_colors, mini_base16 = pcall(require, "mini.base16")
if not status_colors then
	return
end

mini_base16.setup({
	palette = {
		base00 = "#2E3440", -- background
		base01 = "#3B4252", -- side and cursor line
		base02 = "#434C5E", -- scroll, split, statusline padding
		base03 = "#4C566A", -- comments and line number color
		base04 = "#D8DEE9", -- current line number and status line test color
		base05 = "#E5E9F0", -- equal sign, cmp prediction
		base06 = "#ECEFF4", -- unknown
		base07 = "#8FBCBB", -- cmp scrollbar
		base08 = "#88C0D0", -- variables
		base09 = "#81A1C1", -- variable values
		base0A = "#5E81AC", -- keywords
		base0B = "#BF616A", -- []brackets
		base0C = "#D08770", -- ()parantheses
		base0D = "#EBCB8B", -- object.property (the property part)
		base0E = "#A3BE8C", -- lsp key words, and error
		base0F = "#B48EAD", -- commas and symbols
	},
})

vim.cmd([[hi LineNr guibg=NONE]]) -- line number
vim.cmd([[hi SignColumn guibg=NONE]]) -- signcolumn
vim.cmd([[hi VertSplit ctermbg=NONE guibg=NONE]]) -- split
