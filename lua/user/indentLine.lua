local status_ok, indentLine = pcall(require, "indent_blankline")
if not status_ok then
	print("caca")
	return
end

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")
vim.opt.termguicolors = true

indentLine.setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
})
