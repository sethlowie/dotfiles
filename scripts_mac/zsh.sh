#! /bin/bash

brew install zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> $HOME/.zshrc

echo "source ~/dotfiles/zsh/zshrc_manager.sh" >> $HOME/.zshrc

