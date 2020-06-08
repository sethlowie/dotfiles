" ================== VIM PLUGGED ================== "
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-rhubarb'
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'christoomey/vim-tmux-navigator'

" GIT
Plug 'tpope/vim-fugitive'

" GAMES
" Plug 'ThePrimeagen/vim-be-good'

" THEMES
Plug 'hzchirs/vim-material'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'dracula/vim', { 'as': 'dracula' }

" Elm
Plug 'mattn/emmet-vim'
Plug 'elmcast/elm-vim'
Plug 'andys8/vim-elm-syntax'

" React
Plug 'ianks/vim-tsx'

" IDE Support
" Plug 'ycm-core/YouCompleteMe'
" Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-commentary'
Plug 'janko/vim-test'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chr4/nginx.vim'
Plug 'sethlowie/vim-notes'

call plug#end()

" \\\\\\\\\\\\\ "


" ================== KEY BINDINGS ================== "

let mapleader = ","

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" \\\\\\\\\\\\\ "


" ================== THEME ================== "
if (has('termguicolors'))
  set termguicolors
endif
" let g:material_style='oceanic'
set background=dark
" colorscheme vim-material
colorscheme dracula
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paster' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ ['lineinfo'],
      \              [ 'gitbranch' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ }

" \\\\\\\\\\\\\ "

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
nnoremap <silent> <leader>f :FzfPreviewProjectGrep <C-R><C-W><CR>

" #### EDITOR SETTINGS ####
:set syntax=on
:set mouse=a

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

" let g:airline_them = 'nord'
nmap <leader>r :! sh run.sh<CR>

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

let g:typescript_indent_disable = 1

" Allows Emmet Expansion with the Tab key
let g:user_emmet_leader_key=','

" GIT SETTINGS
:set diffopt+=vertical
nnoremap <silent> <Leader>gs :vertical Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit -v<CR>
nnoremap <silent> <Leader>ss :vsp<CR>
nnoremap <silent> <Leader>si :sp<CR>
nnoremap <silent> <Leader>gg :45wincmd_<CR>

" TYPESCRIPT STUFF
" autocmd FileType typescript.tsx nmap <buffer> <leader>gt :<C-u>echo tsuquyomi#hint()<CR>
" autocmd FileType typescript nmap <buffer> <leader>gt :<C-u>echo tsuquyomi#hint()<CR>

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


nnoremap <silent> <leader>gt :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
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
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

:set relativenumber
:set splitbelow
:set splitright

" COMPLETIONS
" fun! GoYCM() 
"   nnoremap <buffer> <silent> <Leader>gd :YouCompleter GoTo<CR>
"   nnoremap <buffer> <silent> <Leader>gr :YouCompleter GoToReferences<CR>
"   nnoremap <buffer> <silent> <Leader>rr :YouCompleter RefactorName<CR>
" endfun

" fun! GoCoc()
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction


  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  inoremap <silent><expr> <Leader>c coc#refresh()

  nmap <buffer> <Leader>gd <Plug>(coc-definition)
  nmap <buffer> <Leader>gy <Plug>(coc-type-definition)
  nmap <buffer> <Leader>gr <Plug>(coc-references)
  nmap <buffer> <Leader>v <Plug>(coc-fix-current)
  nmap <buffer> <Leader>rr <Plug>(coc-rename)
" endfun

" autocmd FileType typescript,javascript,elm :call GoYCM()
" autocmd FileType html :call GoYCM()
:set noshowmode
