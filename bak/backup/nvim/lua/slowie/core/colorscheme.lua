-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- local status, _ = pcall(vim.cmd, "colorscheme dracula")
-- local status, _ = pcall(vim.cmd, "colorscheme neon")
local status, _ = pcall(vim.cmd, "colorscheme nord")
if not status then
	print("Colorscheme not found")
end

-- vim.g.neon_style = "dark"

vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NonText guibg=none")
vim.cmd("autocmd ColorScheme * hi Normal guibg=none ctermbg=none")
vim.cmd("highlight SignColumn guibg=none")
