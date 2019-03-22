#! /bin/bash

echo "Name:"
read name

echo "Email:"
read email

sudo apt-get update

sudo apt-get install -y git xclip

git config --global user.name "$name"
git config --global user.email "$email"

ssh-keygen -t rsa -b 4096 -C "$email" -P "" -f ~/.ssh/my_key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/my_key

## EXTRAS
# sh ./scripts/haskell.sh

echo "Public key copied to clipboard"
echo "## COPY THIS PUBLIC KEY TO GITHUB ##"
echo ""
cat ~/.ssh/my_key.pub|xclip -i -selection clipboard

read -p "Press Enter to Continue Installation"

git clone git@github.com:logiXbomb/dotfiles.git ~/dotfiles

sh ~/dotfiles/scripts/vim.sh
sh ~/dotfiles/scripts/zsh.sh
sh ~/dotfiles/scripts/tmux.sh
sh ~/dotfiles/scripts/docker.sh
sh ~/dotfiles/scripts/docker-compose.sh
sh ~/dotfiles/scripts/gcloud.sh
sh ~/dotfiles/scripts/kubectl.sh
sh ~/dotfiles/scripts/go.sh

