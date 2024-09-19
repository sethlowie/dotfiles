local useBackup = os.getenv("USE_BACKUP")

if useBackup then
	require("settings")

	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup("plugins")
else
	require("sethlowie.core")
	require("sethlowie.lazy")

	vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
		pattern = "*.jet",
		command = "setfiletype html",
	})

	vim.cmd([[
      " highlight Visual ctermbg=240 guibg=#444444
      " highlight Search ctermbg=58 guibg=#5f5f00
      " highlight IncSearch ctermbg=58 guibg=#5f5f00
      " highlight CursorLine ctermbg=235 guibg=#262626

      highlight Normal ctermbg=none guibg=none
      highlight NormalNC ctermbg=none guibg=none
      highlight NonText ctermbg=none guibg=none
      highlight LineNr ctermbg=none guibg=none
      highlight Folded ctermbg=none guibg=none
      highlight EndOfBuffer ctermbg=none guibg=none
      highlight SignColumn ctermbg=none guibg=none
      highlight VertSplit ctermbg=none guibg=none
      highlight StatusLine ctermbg=none guibg=none
      highlight StatusLineNC ctermbg=none guibg=none
      highlight Pmenu ctermbg=none guibg=none
      " highlight Pmenu guibg=#2E3440
      highlight PmenuSbar ctermbg=none guibg=none
      highlight PmenuThumb ctermbg=none guibg=none
      " highlight PmenuSel ctermbg=none guibg=none
      highlight PmenuSel guibg=#3B4252
      highlight WinSeparator ctermbg=none guibg=none
      highlight CursorColumn ctermbg=none guibg=none
      highlight ColorColumn ctermbg=none guibg=none
      highlight FoldColumn ctermbg=none guibg=none
      highlight TabLine ctermbg=none guibg=none
      highlight TabLineFill ctermbg=none guibg=none
      highlight TabLineSel ctermbg=none guibg=none
      highlight NvimTreeNormal guibg=NONE ctermbg=NONE
      highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE
      highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
      highlight NvimTreeVertSplit guibg=NONE ctermbg=NONE
      highlight NvimTreeWinSeparator guibg=NONE ctermbg=NONE
      highlight TelescopeBorder guibg=NONE ctermbg=NONE
      highlight TelescopeNormal guibg=NONE ctermbg=NONE
      highlight TelescopePromptBorder guibg=NONE ctermbg=NONE
      highlight TelescopeResultsBorder guibg=NONE ctermbg=NONE
      highlight TelescopePreviewBorder guibg=NONE ctermbg=NONE
    ]])
	-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
end
