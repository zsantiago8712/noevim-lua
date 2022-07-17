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
    }
})


--Install los plugins aqui
return packer.startup(function(use)
    
    -- Obligatatios
    use({ "wbthomason/packer.nvim" })
    use({ "nvim-lua/plenary.nvim",  })


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
    use({ "antoinemadec/FixCursorHold.nvim" })


    --Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    })

    -- Se configura automaticamente despues de clonar pakcer.nvim
    -- Simpre tiene que ir al final de los plugins
    if packer_bootstrap then
	    require('packer').sync()
    end

end)

