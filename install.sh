#! /bin/bash

waitFor () {
  echo $1
  stty -echo
  read x
  stty echo
}

echo "Name:"
read name

echo "Email:"
read email

sudo apt-get update

sudo apt-get install -y \
  git \
  xclip \
  curl

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

waitFor "Press Enter to Continue Installation"

git clone git@github.com:logiXbomb/dotfiles.git ~/dotfiles

waitFor "Install VIM"
sh ~/dotfiles/scripts/vim.sh

waitFor "Install TMUX"
sh ~/dotfiles/scripts/tmux.sh

waitFor "Install Docker"
sh ~/dotfiles/scripts/docker.sh

waitFor "Install Docker Compose"
sh ~/dotfiles/scripts/docker-compose.sh

waitFor "Install GCloud"
sh ~/dotfiles/scripts/gcloud.sh

waitFor "Install KubeCTL"
sh ~/dotfiles/scripts/kubectl.sh

waitFor "Install Go"
sh ~/dotfiles/scripts/go.sh

waitFor "Install NodeJS"
sh ~/dotfiles/scripts/nodejs.sh

waitFor "Install Alacritty"
sh ~/dotfiles/scripts/alacritty.sh

waitFor "Install FuraCode Nerd Font Mono"
sh ~/dotfiles/scripts/nerd-fonts.sh

waitFor "Install Slack"
sh ~/dotfiles/scripts/slack.sh

waitFor "Install ZSH"
sh ~/dotfiles/scripts/zsh.sh

sudo shutdown -r now

