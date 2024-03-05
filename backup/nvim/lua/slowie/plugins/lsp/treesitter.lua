local setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not setup then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"elm",
	},
	auto_install = true,
})
