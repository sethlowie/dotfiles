#! /bin/bash

sudo echo ""

install() {
	(sh ~/dotfiles/scripts/$2.sh ; /bin/false) &

	# ⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏

	tput civis -- invisible

	pid=$! ; i=0
	while ps -a | awk '{print $1}' | grep -q "${pid}"
	do
			c=`expr ${i} % 10`
			case ${c} in
				 0) echo "Installing $1 ⠋\c" ;;
				 1) echo "Installing $1 ⠙\c" ;;
				 2) echo "Installing $1 ⠹\c" ;;
				 3) echo "Installing $1 ⠸\c" ;;
				 4) echo "Installing $1 ⠼\c" ;;
				 5) echo "Installing $1 ⠴\c" ;;
				 6) echo "Installing $1 ⠦\c" ;;
				 7) echo "Installing $1 ⠧\c" ;;
				 8) echo "Installing $1 ⠇\c" ;;
				 9) echo "Installing $1 ⠏\c" ;;
			esac
			i=`expr ${i} + 1`
			# change the speed of the spinner by altering the 1 below
			sleep 0.1
			echo "\r\c"
	done

	tput cnorm -- normal

	# Collect the return code from the background process

	wait ${pid}
	ret=$?

	# You can report on any errors due to a non zero return code here

	# exit ${ret}
}

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

sudo apt-get update > /dev/null

sudo apt-get install -y \
  git \
  xclip \
  curl > /dev/null

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

git clone git@github.com:logiXbomb/dotfiles.git ~/dotfiles > /dev/null

install Vim vim

install TMUX tmux

install Docker docker

install "Docker Compose" docker-compose

install GCloud gcloud

install KubeCTL kubectl

install Go go

# install NodeJS nodejs

install Alacritty alacritty

install "Nerd Fonts" nerd-fonts

# install Slack slack

# install Zoom zoom

# install "Facetime Camera" facetime_cam

install ZSH zsh

# sudo shutdown -r now


#!/bin/sh

# The command you are waiting on goes between the ( ) here
# The example below returns a non zero return code


