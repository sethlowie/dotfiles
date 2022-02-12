require'lspconfig'.rescriptls.setup{
    cmd = {
        'node',
        '/home/slowie/.vim/plugged/vim-rescript/server/out/server.js',
        '--stdio'
    }
}
