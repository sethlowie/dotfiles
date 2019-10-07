" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'elmcast/elm-vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'kaicataldo/material.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'janko/vim-test'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tomasiser/vim-code-dark'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'posva/vim-vue'
" Plug 'heavenshell/vim-tslint'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

call plug#end()

let mapleader = ","

:set completeopt = "menuone"

" #### EDITOR SETTINGS ####
" if has("termguicolors")
" 	:set termguicolors
" endif
" :set foldmethod=syntax
:set syntax=on
:set background=dark
" let g:codedark_conservative = 1
colorscheme codedark
let g:airline_them = 'codedark'

vmap <leader>y "+y
nmap <leader>p "+p

let g:airline_powerline_fonts = 1

:set path+=**
:set wildmenu

let g:netrw_banner=0
let g:netrw_liststyle=3

set number
let g:go_disable_autoinstall = 0

" NERDTree
map <leader><Tab> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" bookmarks
" map <leader>gr :OpenBookmark renderer<CR>
" map <leader>gp :OpenBookmark platform<CR>
" map <leader>ga :OpenBookmark apps<CR>
" map <leader>gd :OpenBookmark digital<CR>

" open on empty file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" #### VIM TEST MAPPINGS ####
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

let test#custom_runners = {'Bash': ['ShUnit2']}

" #### Highlight ####
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

:set tabstop=2
:set shiftwidth=2
:set softtabstop=0
:set expandtab
:set backspace=indent,eol,start

" GLOBAL GO TO
function GoTo()
  if &filetype ==# 'typescript' || &filetype ==# 'typescript.tsx'
    call tsuquyomi#definition()
  elseif &filetype ==# 'go'
    call go#def#Jump('', 0)
  else
    echo &filetype
  endif
endfunction
nmap <silent> <leader>gd :call GoTo()<CR>

" Allows Emmet Expansion with the Tab key
" imap <expr> <tab> emmet#expandAbbrIntelligent("\,")
let g:user_emmet_leader_key=','

let g:deoplete#enable_at_startup = 1

" GIT SETTINGS
:set diffopt+=vertical

" TYPESCRIPT STUFF
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" RUST SETTINGS
:let g:rustfmt_autosave = 1

" GO SETTINGS
nmap <silent> <leader>gr :! go run *.go<CR>
let g:go_fmt_command = "goimports"
let test#go#runner = 'richgo'

" ALE SETTINGS
:let b:ale_fixers = {'js': ['eslint']}
let g:ale_linters = { 'go': ['gofmt', 'go vet'], 'javascript': ['eslint']}


" ELM SETTINGS
autocmd FileType elm
       \ call deoplete#custom#buffer_option('auto_complete', v:false)
