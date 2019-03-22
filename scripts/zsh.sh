#! /bin/bash

echo "source ~/dotfiles/zsh/zshrc_manager.sh" >> ~/.zshrc
sed -i '1s/^/source ~/dotfiles/zsh/zshrc_manager.sh\n/' ~/.zshrc
