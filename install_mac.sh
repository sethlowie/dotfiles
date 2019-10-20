#! /bin/bash

sudo echo ""

install() {
	local name="$1"
	shift 1
	("$@" >/dev/null 2>&1 ; /usr/bin/false) &

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
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	git config --global user.name "$name"
	git config --global user.email "$email"

	ssh-keygen -t rsa -b 4096 -C "$email" -P "" -f ~/.ssh/my_key
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/my_key 2> /dev/null
}

install "Git" init

cat ~/.ssh/my_key.pub | pbpaste
waitFor "Add Key to Github and Press Enter to Continue Installation\r\c"

install Dotfiles git clone --quiet git@github.com:logiXbomb/dotfiles.git ~/dotfiles

install Vim sh ~/dotfiles/scripts_mac/vim.sh

install TMUX sh ~/dotfiles/scripts_mac/tmux.sh

install Alacritty sh ~/dotfiles/scripts_mac/alacritty.sh

install "Nerd Fonts" sh ~/dotfiles/scripts_mac/nerd-fonts.sh

install ZSH sh ~/dotfiles/scripts_mac/zsh.sh

install Docker sh ~/dotfiles/scripts_mac/docker.sh

install Rust sh ~/dotfiles/scripts_mac/rust.sh

install Go sh ~/dotfiles/scripts_mac/go.sh

install Node sh ~/dotfiles/scripts_mac/nodejs.sh

chsh -s $(which zsh)

nvim +'PlugInstall --sync' +qa
nvim +'UpdateRemotePlugins' +qa
