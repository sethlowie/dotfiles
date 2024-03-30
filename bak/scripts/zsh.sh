#! /bin/bash

sudo apt-get install -y zsh

sh ~/dotfiles/scripts/oh-my-zsh.sh

git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> $HOME/.zshrc

echo "source ~/dotfiles/zsh/zshrc_manager.sh" >> $HOME/.zshrc

