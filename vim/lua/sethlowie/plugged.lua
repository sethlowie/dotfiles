local cmd = vim.cmd
-- ================== VIM PLUGGED ================== --
cmd("call plug#begin('~/.vim/plugged')")
cmd("Plug 'rust-lang/rust.vim'")
cmd("Plug 'tpope/vim-rhubarb'")
cmd("Plug 'yuki-ycino/fzf-preview.vim'")
cmd("Plug 'nvim-lua/popup.nvim'")
cmd("Plug 'nvim-lua/plenary.nvim'")
cmd("Plug 'ThePrimeagen/git-worktree.nvim'")
cmd("Plug 'nvim-telescope/telescope.nvim'")
cmd("Plug 'nvim-telescope/telescope-fzy-native.nvim'")
cmd("Plug 'christoomey/vim-tmux-navigator'")
cmd("Plug 'tpope/vim-surround'")
cmd("Plug 'sheerun/vim-polyglot'")
cmd("Plug 'wakatime/vim-wakatime'")

-- GIT
cmd("Plug 'tpope/vim-fugitive'")
cmd("Plug 'stsewd/fzf-checkout.vim'")
cmd("Plug 'mtdl9/vim-log-highlighting'");

-- THEMES
cmd("Plug 'joshdick/onedark.vim'")

-- BLOCKCHAIN
cmd("Plug 'tomlion/vim-solidity'")

-- Elm
cmd("Plug 'mattn/emmet-vim'")
cmd("Plug 'elmcast/elm-vim'")
cmd("Plug 'andys8/vim-elm-syntax'")

-- React
cmd("Plug 'ianks/vim-tsx'")

-- IDE Support
cmd("Plug 'neovim/nvim-lspconfig'")
cmd("Plug 'hrsh7th/nvim-compe'")
cmd("Plug 'hrsh7th/vim-vsnip'")
cmd("Plug 'glepnir/lspsaga.nvim'")
cmd("Plug 'kosayoda/nvim-lightbulb'")
cmd("Plug 'onsails/lspkind-nvim'")
-- cmd("Plug 'kabouzeid/nvim-lspinstall'")
-- Plug 'nvim-lua/completion-nvim'
-- cmd("Plug 'neoclide/coc.nvim', {'branch': 'release'}")
cmd("Plug 'jiangmiao/auto-pairs'")
cmd("Plug 'mhinz/vim-startify'")

cmd("Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }")
-- cmd("Plug 'tpope/vim-commentary'")
cmd("Plug 'tomtom/tcomment_vim'")
cmd("let g:tcomment#filetype#guess_typescriptreact = 1")
cmd("Plug 'sethlowie/vim-test'")
cmd("Plug 'scrooloose/nerdtree'")
cmd("Plug 'hoob3rt/lualine.nvim'")
cmd("Plug 'ryanoasis/vim-devicons'")
cmd("Plug 'tiagofumo/vim-nerdtree-syntax-highlight'")
cmd("Plug 'Xuyuanp/nerdtree-git-plugin'")
cmd("Plug 'posva/vim-vue'")
cmd("Plug 'peitalin/vim-jsx-typescript'")
cmd("Plug 'Shougo/vimproc.vim', { 'do': 'make' }")
cmd("Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }")
cmd("Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }")
cmd("Plug 'junegunn/fzf.vim'")
cmd("Plug 'chr4/nginx.vim'")
cmd("Plug 'sethlowie/vim-notes'")

cmd("call plug#end()")


cmd("autocmd User Fugitive command! -buffer -bar Gmylog exe 'terminal' FugitivePrepare(['log', '--oneline', '--decorate', '--graph', '--all'])")
