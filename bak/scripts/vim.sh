#! /bin/bash

# Install vim-plug
# https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install pip3
sudo apt-get install -y neovim python3-neovim

# Install neovim library for vim deoplete
# pip3 install neovim

mkdir -p $HOME/.config/nvim

echo "source ~/dotfiles/vim/vimrc.vim" >> "$HOME/.config/nvim/init.vim"

