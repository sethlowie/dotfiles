#! /bin/bash

sudo apt-get install zsh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "source ~/dotfiles/zsh/zshrc_manager.sh" >> ~/.zshrc
sed -i '1s/^/source ~/dotfiles/zsh/zshrc_manager.sh\n/' ~/.zshrc
