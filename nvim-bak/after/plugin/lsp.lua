local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

local saga = require('lspsaga')

saga.init_lsp_saga()

vim.keymap.set("n", "<leader>gt", function () vim.cmd.Lspsaga("hover_doc") end)

vim.keymap.set("n", "<leader>gh", function () vim.cmd.Lspsaga("code_action") end)
