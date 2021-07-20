let g:lightline = {
      \ 'colorscheme': 'onedark',
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

let g:fzf_branch_actions = {
      \ 'track': {'keymap': 'enter'},
      \}

:luafile ~/dotfiles/vim/init.lua
