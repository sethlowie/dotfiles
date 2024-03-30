vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local cmd = vim.cmd
require("sethlowie/plugged")
require("sethlowie/typescript")
require("sethlowie/elm")
require("sethlowie/go")
require("sethlowie/tailwind")
require("sethlowie/rust")
require("sethlowie/deno")
require("sethlowie/resscript")
require("sethlowie/svelte")

local nvim_set_keymap = vim.api.nvim_set_keymap
local nvim_set_option = vim.api.nvim_set_option
local opt = vim.opt

require("nvim-tree").setup()

vim.g.mapleader = ","
vim.g.airline_powerline_fonts = 1
opt.termguicolors = true

nvim_set_keymap('n', '<Leader>o', ':NvimTreeFindFile<CR>', {})

-- GO STUFF

-- easier window jumps
nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- copy/paste
nvim_set_keymap('v', '<Leader>y', '"+y', {})
nvim_set_keymap('n', '<Leader>p', '"+p', {})

-- COC STUFF
nvim_set_keymap('n', '<Leader>af', ':CocCommand eslint.executeAutofix<CR>', {})

-- TESTING
nvim_set_keymap('n', '<Leader>tn', ':TestNearest<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>tf', ':TestFile<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>ts', ':TestSuite<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>tl', ':TestLast<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>tg', ':TestVisit<CR>', { noremap = true, silent = true })

-- GENERAL OPTIONS
nvim_set_option('updatetime', 100)
nvim_set_keymap('', '<Leader><Tab>', ':NvimTreeToggle<CR>', {})
nvim_set_keymap('n', '<Leader>sv', ':source $MYVIMRC', { noremap = true })
nvim_set_option('mouse', 'a')
nvim_set_option('syntax', 'on')
nvim_set_option('path', '**')
nvim_set_option('wildmenu', true)
vim.cmd('let NERDTreeShowLineNumbers=1')
vim.cmd('let NERDTreeMinimalUI=1')
vim.cmd('let NERDTreeDirArrows=1')
vim.cmd('autocmd FileType nerdtree setlocal relativenumber')
vim.g.netrw_banner=0
vim.g.netrw_liststyle=3
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 0
opt.expandtab = true
opt.backspace = 'indent,eol,start'
opt.relativenumber = true
opt.splitbelow = true
opt.splitright = true
vim.cmd("let noshowmode = 1")

nvim_set_keymap('n', '<Leader>[', ':cprev<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>]', ':cnext<CR>', { noremap = true, silent = true })

vim.g.go_fmt_command = 'goimports'

-- GIT STUFF
-- vim.api.nvim_set_option('diffopt', 'vertical')
nvim_set_keymap('n', '<Leader>gs', ':vertical Git<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>gc', ':Git commit -v<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>gp', ':Git push -v<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>gg', ':45wincmd_<CR>', { noremap = true, silent = true })

vim.cmd('colorscheme onedark')

require("sethlowie.telescope")
require("sethlowie.lualine")
require("sethlowie.ide")

cmd("highlight Normal ctermbg=none guibg=none")
cmd("highlight NonText ctermbg=none guibg=none")
