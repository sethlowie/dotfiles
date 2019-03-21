#! /bin/bash

sudo apt-get update

########################################
############## VIM SETUP ###############
########################################

# Install vim-plug
# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install pip3
sudo apt-get install -y python3-pip

# Install neovim library for vim deoplete
pip3 install neovim

echo "source ~/dotfiles/vim/vimrc.vim" >> ".vimrc"


########################################
############## TMUX SETUP ##############
########################################

sudo apt-get install -y tmux

echo "source ~/dotfiles/tmux/tmux.conf" >> ".tmux.conf"

########################################
############## ZSH SETUP ###############
########################################

echo "source ~/dotfiles/zsh/zshrc_manager.sh" >> ".zshrc"
sed -i '1s/^/source ~/dotfiles/zsh/zshrc_manager.sh\n/' ~/.zshrc

