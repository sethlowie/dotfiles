return {
	{
		"vim-test/vim-test",
		dependencies = {
			"preservim/vimux",
		},
		config = function()
			vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>")
			vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<cr>")
			vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<cr>")
			-- set vimux strategy to vertical split
			-- vim.g["test#strategy"] = "vimux"
		end,
	},
}
