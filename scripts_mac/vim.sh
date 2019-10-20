#! /bin/bash

# Install vim-plug
# https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew install neovim

mkdir -p $HOME/.config/nvim

echo "source ~/dotfiles/vim/vimrc.vim" >> "$HOME/.config/nvim/init.vim"

