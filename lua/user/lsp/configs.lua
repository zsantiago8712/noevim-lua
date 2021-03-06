local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

require("lsp_signature").on_attach()
-- local sumneko_root_path = vim.fn.expand("$HOME")..'/github/sumneko/lua-language-server'
-- local sumneko_binary = vim.fn.expand("$HOME")..'/github/sumneko/lua-language-server/bin/macOS/lua-language-server'
local on_attach = function(client, bufnr)
	require("lsp_signature").on_attach()
end

local servers = { "jsonls", "sumneko_lua", "clangd" }

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		--on_attach = require("user.lsp.handlers").on_attach,
		--capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end

lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
			diagnostics = {
				globals = { "vim", "awesome", "client", "root", "tag", "screen", "mouse" },
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
