local g = vim.g
local cmd = vim.cmd
local nvim_set_keymap = vim.api.nvim_set_keymap

cmd('let test#go#runner = "richgo"')

g.go_disable_autoinstall = 0
g.go_highlight_functions = 1
g.go_highlight_function_calls = 1
g.go_highlight_methods = 1
g.go_highlight_structs = 1
g.go_highlight_operators = 1
g.go_highlight_build_constraints = 1

nvim_set_keymap('n', '<Leader>gv', ':GoVet<CR>', {})

