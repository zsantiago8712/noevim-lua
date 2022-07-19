local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

status_ok, dapui = pcall(require, "dapui")
if not status_ok then
	return
end

dapui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" })
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "" })

dap.adapters.lldb = {
	type = "executable",
	command = "/opt/homebrew/opt/llvm/bin/lldb-vscode",
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Hasbu",
		type = "lldb",
		request = "launch",
		-- program = function()
		-- 	return vim.fn.input(
		-- 		"Path to executable: ",
		-- 		vim.fn.getcwd() .. "/bin/Debug-macosx-ARM64/Hasbu/",
		-- 		"Hasbu.app"
		-- 	)
		-- end,
		--
		program = vim.fn.getcwd() .. "/bin/Debug-macosx-ARM64/Hasbu/Hasbu.app",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},

		-- 💀
		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		-- runInTerminal = false,
	},
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- dapui.setup({
-- 	icons = { expanded = "▾", collapsed = "▸" },
-- 	mappings = {
-- 		-- Use a table to apply multiple mappings
-- 		expand = { "<CR>", "<2-LeftMouse>" },
-- 		open = "o",
-- 		remove = "d",
-- 		edit = "e",
-- 		repl = "r",
-- 		toggle = "t",
-- 	},
--
-- 	layouts = {
-- 		{
-- 			elements = {
-- 				"scopes",
-- 				"breakpoints",
-- 				"stacks",
-- 				"watches",
-- 			},
-- 			size = 40,
-- 			position = "left",
-- 		},
-- 		{
-- 			elements = {
-- 				"repl",
-- 				--"console",
-- 			},
-- 			size = 10,
-- 			position = "bottom",
-- 		},
-- 	},
--
-- 	-- Expand lines larger than the window
-- 	-- Requires >= 0.7
-- })
