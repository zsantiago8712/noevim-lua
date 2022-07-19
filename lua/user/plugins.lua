local fn = vim.fn
-- Installa Packer si no lo tienes
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Recarga Packer cuando se guarda el archivo
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Proteje cunado es la primera vez abireondo neovim con Packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

--Install los plugins aqui
return packer.startup(function(use)
	-- Obligatatios
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })

	--Color Schemes
	use({ "folke/tokyonight.nvim" })
	use({ "navarasu/onedark.nvim" })
	use({ "EdenEast/nightfox.nvim" })

	--Telescope
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", requires = { "nvim-telescope/telescope.nvim" }, run = "make" })
	use({ "cljoly/telescope-repo.nvim" })
	use({ "ahmedkhalf/project.nvim" })

	--Which Key
	use({ "folke/which-key.nvim" })

	--Fix Cursor
	use({
		"antoinemadec/FixCursorHold.nvim",
		run = function()
			vim.g.curshold_updatime = 1000
		end,
	})

	--Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- Rainbow Treesiter
	use({ "p00f/nvim-ts-rainbow" })

	--Auto pairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	--Buffer Line
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

	--Lua line
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	--LSP
	use({ "neovim/nvim-lspconfig" })
	use({ "tamago324/nlsp-settings.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "williamboman/nvim-lsp-installer" })

	-- Scheme json
	use({ "b0o/schemastore.nvim" })

	--- Snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- Impatient
	use({ "lewis6991/impatient.nvim" })

	-- Navigator
	use({
		"ray-x/navigator.lua",
		requires = { { "ray-x/guihua.lua", run = "cd lua/fzy && make" }, { "neovim/nvim-lspconfig" } },
	})

	-- Lsp-Signature
	use({ "ray-x/lsp_signature.nvim" })

	-- Troubles
	use({ "folke/trouble.nvim" })

	-- Alpha
	use({ "goolord/alpha-nvim" })

	-- Comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Nump
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})

	-- Indent Blanck Line
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- File browser
	--use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- Lua Tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	})

	-- Lua Dev
	use({ "folke/lua-dev.nvim" })

	-- SQLlite
	use({ "tami5/sqlite.lua" })

	-- Cheat Sheats
	use({ "nvim-telescope/telescope-cheat.nvim" })

	--  Todo comments
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})

	-- GitSigns
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({ current_line_blame = true })
		end,
	})

	use({ "norcalli/nvim-colorizer.lua" })

	-- Find Symbols
	use({ "simrat39/symbols-outline.nvim" })

	-- TODO: CAcabar de configurar el debugger
	-- Debuger
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "theHamsta/nvim-dap-virtual-text" })
	use({ "nvim-telescope/telescope-dap.nvim" })
	-- Se configura automaticamente despues de clonar pakcer.nvim
	-- Simpre tiene que ir al final de los plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
