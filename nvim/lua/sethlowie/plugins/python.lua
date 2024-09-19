return {
	{
		"psf/black",
		ft = "python",
		config = function()
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.py",
				callback = function()
					vim.cmd("Black")
				end,
			})
		end,
	},
	{
		"fisadev/vim-isort",
		ft = "python",
		config = function()
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.py",
				callback = function()
					vim.cmd("Isort")
				end,
			})
		end,
	},
	{
		"AckslD/swenv.nvim",
		ft = "python",
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>pe",
				":lua require('swenv.api').pick_venv()<cr>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
