" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'elmcast/elm-vim'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'yuki-ycino/fzf-preview.vim'

" THEMES
Plug 'kaicataldo/material.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-commentary'
Plug 'vim-syntastic/syntastic'
Plug 'janko/vim-test'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'posva/vim-vue'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chr4/nginx.vim'

call plug#end()

let mapleader = ","

:set completeopt = "menuone"

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color=always '.shellescape(<q-args>), 1, <bang>0)

nnoremap <C-p> :FzfPreviewDirectory<Cr>
" #### EDITOR SETTINGS ####
:set syntax=on
:set mouse=a
" :set background=nord
colorscheme nord
" let g:airline_them = 'nord'
nmap <leader>r :! sh run.sh<CR>

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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

" NERDTree open on empty file
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <leader>o :NERDTreeFind<CR>

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
let g:user_emmet_leader_key=','

" GIT SETTINGS
:set diffopt+=vertical
nnoremap <silent> <Leader>gs :Gstatus<CR>:15wincmd_<CR>
nnoremap <silent> <Leader>gv :Gdiffsplit<CR>
nnoremap <silent> <Leader>gr :Gread<CR> :w<CR> :Gcommit -v<CR>
nnoremap <silent> <Leader>gc :Gcommit -v<CR>

" TYPESCRIPT STUFF
autocmd FileType typescript.tsx nmap <buffer> <leader>gt :<C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <leader>gt :<C-u>echo tsuquyomi#hint()<CR>

" RUST SETTINGS
:let g:rustfmt_autosave = 1

" PRETTIER SETTINGS
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" GO SETTINGS
let g:go_fmt_command = "goimports"
let test#go#runner = 'richgo'

" ALE SETTINGS
let b:ale_fixers = {'js': ['eslint']}
let g:ale_linters = { 'go': ['gofmt', 'go vet'], 'javascript': ['eslint']}


" ELM SETTINGS
autocmd FileType elm
       \ call deoplete#custom#buffer_option('auto_complete', v:false)
