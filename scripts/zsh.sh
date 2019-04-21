#! /bin/bash

sudo apt-get install -y zsh

sh ~/dotfiles/scripts/oh-my-zsh.sh

git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k

echo 'source  ~/powerlevel9k/powerlevel9k.zsh-theme' >> $HOME/.zshrc
echo "source ~/dotfiles/zsh/zshrc_manager.sh" >> $HOME/.zshrc
echo 'ZSH_THEME="powerlevel9k/powerlevel9k"' >> $HOME/.zshrc

