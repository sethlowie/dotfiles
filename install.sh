#! /bin/bash

sudo echo ""

install() {
	local name="$1"
	shift 1
	("$@" > /dev/null ; /bin/false) &

	# ⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏

	tput civis -- invisible

	pid=$! ; i=0
	while ps -a | awk '{print $name}' | grep -q "${pid}"
	do
			c=`expr ${i} % 10`
			case ${c} in
				 0) echo "Installing $name \033[0;36m⠋\033[0m\c" ;;
				 1) echo "Installing $name \033[0;36m⠙\033[0m\c" ;;
				 2) echo "Installing $name \033[0;36m⠹\033[0m\c" ;;
				 3) echo "Installing $name \033[0;36m⠸\033[0m\c" ;;
				 4) echo "Installing $name \033[0;36m⠼\033[0m\c" ;;
				 5) echo "Installing $name \033[0;36m⠴\033[0m\c" ;;
				 6) echo "Installing $name \033[0;36m⠦\033[0m\c" ;;
				 7) echo "Installing $name \033[0;36m⠧\033[0m\c" ;;
				 8) echo "Installing $name \033[0;36m⠇\033[0m\c" ;;
				 9) echo "Installing $name \033[0;36m⠏\033[0m\c" ;;
			esac
			i=`expr ${i} + 1`
			# change the speed of the spinner by altering the 1 below
			sleep 0.1
			echo "\r\c"
	done

	echo "\r\c"

	echo "$name installed ✓\c"

	echo ""

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

init() {
	sudo apt-get update

	sudo apt-get install -y \
		git \
		xclip \
		curl

	git config --global user.name "$name"
	git config --global user.email "$email"

	ssh-keygen -t rsa -b 4096 -C "$email" -P "" -f ~/.ssh/my_key
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/my_key 2> /dev/null
}

install "Git" init

echo "Public key copied to clipboard"
echo "## COPY THIS PUBLIC KEY TO GITHUB ##"
echo ""
cat ~/.ssh/my_key.pub|xclip -i -selection clipboard
waitFor "Press Enter to Continue Installation"

install Dotfiles git clone --quiet git@github.com:logiXbomb/dotfiles.git ~/dotfiles

# install Vim sh ~/dotfiles/scripts/vim.sh

# install TMUX sh ~/dotfiles/scripts/tmux.sh

# install Docker sh ~/dotfiles/scripts/docker.sh

# install "Docker Compose" sh ~/dotfiles/scripts/docker-compose.sh

# install GCloud sh ~/dotfiles/scripts/gcloud.sh

# install KubeCTL sh ~/dotfiles/scripts/kubectl.sh

# install Go sh ~/dotfiles/scripts/go.sh

# install NodeJS sh ~/dotfiles/scripts/nodejs.sh

# install Alacritty sh ~/dotfiles/scripts/alacritty.sh

# install "Nerd Fonts" sh ~/dotfiles/scripts/nerd-fonts.sh

# install Slack sh ~/dotfiles/scripts/slack.sh

# install Zoom sh ~/dotfiles/scripts/zoom.sh

# install "Facetime Camera" sh ~/dotfiles/scripts/facetime_cam.sh

# install ZSH sh ~/dotfiles/scripts/zsh.sh

# sudo shutdown -r now

