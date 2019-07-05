TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

source ~/dotfiles/zsh/zshrc.sh
if command -v tmux>/dev/null; then
	[ -z $TMUX ] && exec tmux
else
	echo "tmux not installed. Run ./deploy to configure dependencies"
fi

echo "Checking for updates"

(cd ~/dotfiles && git pull && git submodule update --init --recursive)
source ~/dotfiles/zsh/keybindings.sh

alacrittyUpdate() {
	cp ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml;
	exit;
}
