#! /bin/bash

sudo apt-get install -y zsh

sh ~/dotfiles/scripts/oh-my-zsh.sh

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "source ~/dotfiles/zsh/zshrc_manager.sh" >> $HOME/.zshrc
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> $HOME/.zshrc

