local cmd = vim.cmd
local nvim_set_keymap = vim.api.nvim_set_keymap
local g = vim.g

cmd('let g:prettier#autoformat = 0')
cmd('autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync')

g.typescript_indent_disable = 1
g.user_emmet_leader_key = ','

cmd("autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)")
cmd("autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)")
cmd("autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)")
cmd("autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)")

