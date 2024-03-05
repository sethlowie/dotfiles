--
-- vim.g["test#javascript#vitest#file_pattern"] = "\v(**/.*|(spec|test)).(js|jsx|coffee|ts|tsx)$"
-- vim.g["test#javascript#cypress#file_pattern"] = "\v(cypress/.*|(cy)).(js|jsx|coffee|ts|tsx)$"
--
--
-- Set default runner for JavaScript and TypeScript to Vitest
vim.g["test#javascript#runner"] = "vitest"
vim.g["test#typescript#runner"] = "vitest"

-- Use an autocmd to switch to Cypress for .cy.ts files
vim.cmd([[
augroup TestRunnerSwitch
    autocmd!
    autocmd BufRead,BufNewFile *.cy.ts let g:test#javascript#runner = 'cypress'
    autocmd BufRead,BufNewFile *.cy.ts let g:test#typescript#runner = 'cypress'
    autocmd BufRead,BufNewFile *.spec.ts let g:test#javascript#runner = 'vitest'
    autocmd BufRead,BufNewFile *.spec.ts let g:test#typescript#runner = 'vitest'
augroup END
]])

-- vim.cmd([[
-- function! MyTestRunnerStrategy(cmd) abort
--     " Print the command for debugging
--     echom "Running command: " . a:cmd
--
--     if a:cmd =~# '\.spec\.ts'
--         " Print a debug message
--         echom "Using vitest for .spec.ts file"
--         call test#strategy#basic(a:cmd . ' --runner=vitest')
--     elseif a:cmd =~# '\.cy\.ts'
--         " Print a debug message
--         echom "Using cypress for .cy.ts file"
--         " call test#strategy#basic(a:cmd . ' --runner=cypress')
--     else
--         " Print a debug message for unhandled cases
--         echom "Unhandled file type"
--     endif
-- endfunction
--
-- let g:test#custom_strategies = {'my_strategy': function('MyTestRunnerStrategy')}
-- let g:test#strategy = 'my_strategy'
-- ]])

require("slowie.plugins-setup")
require("slowie.core.options")
require("slowie.core.keymaps")
require("slowie.core.colorscheme")

-- plugins
require("slowie.plugins.startup")
require("slowie.plugins.runscript")
require("slowie.plugins.comment")
require("slowie.plugins.nvim-tree")
require("slowie.plugins.lualine")
require("slowie.plugins.telescope")
require("slowie.plugins.nvim-cmp")
require("slowie.plugins.lsp.mason")
require("slowie.plugins.lsp.lspsaga")
require("slowie.plugins.lsp.lspconfig")
require("slowie.plugins.lsp.null-ls")

require("slowie.plugins.lsp.autopairs")
require("slowie.plugins.lsp.treesitter")
