#! /bin/bash

sudo apt-get install -y zsh

sh ~/dotfiles/scripts/oh-my-zsh.sh > /dev/null

git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k

echo 'source  ~/powerlevel9k/powerlevel9k.zsh-theme' >> ~/.zshrc
echo "source ~/dotfiles/zsh/zshrc_manager.sh" >> ~/.zshrc
echo 'ZSH_THEME="powerlevel9k/powerlevel9k"' >> ~/.zshrc

env zsh -l
