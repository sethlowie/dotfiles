#! /bin/bash

echo "Name:"
read name

echo "Email:"
read email

sudo apt-get update

sudo apt-get install -y git

git config --global user.name "$name"
git config --global user.email "$email"

ssh-keygen -t rsa -b 4096 -C "$email" -P "" -f ~/.ssh/my_key

## EXTRAS
# sh ./scripts/haskell.sh

echo ""
echo "## COPY THIS PUBLIC KEY TO GITHUB ##"
echo ""
echo ~/.ssh/my_rsa.pub
echo ""
echo ""

read -p "Press Enter to Continue Installation"

git clone git@github.com:logiXbomb/dotfiles.git ~/dotfiles

sh ./scripts/vim.sh
sh ./scripts/zsh.sh
sh ./scripts/tmux.sh
sh ./scripts/docker.sh
sh ./scripts/docker-compose.sh
sh ./scripts/gcloud.sh
sh ./scripts/kubectl.sh
sh ./scripts/go.sh

