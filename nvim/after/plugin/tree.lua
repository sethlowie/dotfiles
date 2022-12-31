require("nvim-tree").setup()

vim.keymap.set("n", "<leader>o", vim.cmd.NvimTreeFindFile)

vim.keymap.set("n", "<leader><Tab>", vim.cmd.NvimTreeToggle)
