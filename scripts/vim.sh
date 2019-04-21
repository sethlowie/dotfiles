#! /bin/bash

# Install vim-plug
# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null

# Install pip3
sudo apt-get install -y vim-gtk3 python3-pip > /dev/null

# Install neovim library for vim deoplete
pip3 install neovim > /dev/null

echo "source ~/dotfiles/vim/vimrc.vim" >> "~/.vimrc"

