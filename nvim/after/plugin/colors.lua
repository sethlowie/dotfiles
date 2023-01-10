function ColorMyPencils(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "DiffviewStatusAdded", { bg = "none", ctermbg = "blue" })
end

ColorMyPencils()

vim.cmd("autocmd User Fugitive command! -buffer -bar Gmylog exe 'terminal' FugitivePrepare(['log', '--oneline', '--decorate', '--graph', '--all'])")

