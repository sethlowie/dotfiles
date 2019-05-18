#! /bin/bash

sudo echo ""

install() {
	local name="$1"
	shift 1
	("$@" >/dev/null 2>&1 ; /bin/false) &

	# ⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏

	tput civis -- invisible

	pid=$! ; i=0
	while ps -a | awk '{print $name}' | grep -q "${pid}"
	do
			c=`expr ${i} % 10`
			case ${c} in
				 0) echo -e " \033[0;36m⠋\033[0m Installing $name\r\c" ;;
				 1) echo -e " \033[0;36m⠙\033[0m Installing $name\r\c" ;;
				 2) echo -e " \033[0;36m⠹\033[0m Installing $name\r\c" ;;
				 3) echo -e " \033[0;36m⠸\033[0m Installing $name\r\c" ;;
				 4) echo -e " \033[0;36m⠼\033[0m Installing $name\r\c" ;;
				 5) echo -e " \033[0;36m⠴\033[0m Installing $name\r\c" ;;
				 6) echo -e " \033[0;36m⠦\033[0m Installing $name\r\c" ;;
				 7) echo -e " \033[0;36m⠧\033[0m Installing $name\r\c" ;;
				 8) echo -e " \033[0;36m⠇\033[0m Installing $name\r\c" ;;
				 9) echo -e " \033[0;36m⠏\033[0m Installing $name\r\c" ;;
			esac
			i=`expr ${i} + 1`
			# change the speed of the spinner by altering the 1 below
			sleep 0.1
	done

	echo -e " \033[1;32m✓ \033[0m $name installed\r"

	tput cnorm -- normal

	# Collect the return code from the background process

	wait ${pid}
	ret=$?

	# You can report on any errors due to a non zero return code here

	# exit ${ret}
}

waitFor () {
  echo -e $1 
  stty -echo
  read x
  stty echo
	tput el
}

echo "Name:"
read name

echo "Email:"
read email

init() {
	echo "StrictHostKeyChecking no" > ~/.ssh/config
	sudo apt-get update

	sudo apt-get install -y \
		git \
		xclip \
		curl \
		bash-completion

	git config --global user.name "$name"
	git config --global user.email "$email"

	ssh-keygen -t rsa -b 4096 -C "$email" -P "" -f ~/.ssh/my_key
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/my_key 2> /dev/null
}

install "Git" init

cat ~/.ssh/my_key.pub|xclip -i -selection clipboard
waitFor "Add Key to Github and Press Enter to Continue Installation\r\c"

install Snap sudo apt-get install -y snapd

install Dotfiles git clone --quiet git@github.com:logiXbomb/dotfiles.git ~/dotfiles

install Vim sh ~/dotfiles/scripts/vim.sh

install TMUX sh ~/dotfiles/scripts/tmux.sh

install Alacritty sh ~/dotfiles/scripts/alacritty.sh

install "Nerd Fonts" sh ~/dotfiles/scripts/nerd-fonts.sh

install ZSH sh ~/dotfiles/scripts/zsh.sh

install Docker sh ~/dotfiles/scripts/docker.sh

install "Docker Compose" sh ~/dotfiles/scripts/docker-compose.sh

install Rust sh ~/dotfiles/scripts/rust.sh

install Go sh ~/dotfiles/scripts/go.sh

install Node sh ~/dotfiles/scripts/nodejs.sh

install Elm sh ~/dotfiles/scripts/elm.sh

install Desktop sh ~/dotfiles/scripts/desktop.sh

install "Linux Containers" sh ~/dotfiles/scripts/linuxcontainers.sh

install Chrome sh ~/dotfiles/scripts/chrome.sh

chsh -s $(which zsh)

nvim +'PlugInstall --sync' +qa
nvim +'UpdateRemotePlugins' +qa

sudo shutdown -r now

