-- ENSURE PACKER IS INSTALLED --
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

-------------------------------

-- Reload neovim when updating packer deps
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- self managed packer
	use("wbthomason/packer.nvim")

	use("github/copilot.vim")

	-- helper functions
	use("nvim-lua/plenary.nvim")

	-- THEME
	use("bluz71/vim-nightfly-guicolors")
	use("Mofiqul/dracula.nvim")
	use("shaunsingh/nord.nvim")
	-- use("arcticicestudio/nord-vim", { branch = "develop" })
	-- use("nordtheme/vim")
	use("rafamadriz/neon")
	use("startup-nvim/startup.nvim")

	-- split management
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")

	-- chat gpt
	use("MunifTanjim/nui.nvim")
	use("dpayne/CodeGPT.nvim")

	-- git
	use("ThePrimeagen/git-worktree.nvim")
	use("tpope/vim-rhubarb")
	use("tpope/vim-fugitive")

	use("dracula/vim", { as = "dracula" })

	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- basic editing
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")
	use("numToStr/Comment.nvim")
	use("mattn/emmet-vim")

	use("vim-test/vim-test")

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- auto complete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- lsp
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")
	-- formatting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("simrat39/rust-tools.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	use("ThePrimeagen/harpoon")

	use("~/go/src/github.com/sethlowie/dev-tools")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
