#! /bin/bash

sudo apt-get install -y zsh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k

echo 'source  ~/powerlevel9k/powerlevel9k.zsh-theme' >> ~/.zshrc
echo "source ~/dotfiles/zsh/zshrc_manager.sh" >> ~/.zshrc
echo 'ZSH_THEME="powerlevel9k/powerlevel9k"' >> ~/.zshrc
