local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮]],
	[[│││├┤ │ │╰┐┌╯││││]],
	[[╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴]],
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("f", "🔎 Find Files", ":Telescope find_files<CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects<CR>"),
	dashboard.button("r", "  Find repo", ":Telescope repo list<CR>"),
	dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}


-- vim.cmd[[autocmd User AlphaReady echo 'ready']]

alpha.setup(dashboard.opts)

alpha.setup(require("alpha.themes.dashboard").config)
vim.cmd("hi! DashboardFooter guifg=NONE")
