TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

if command -v tmux>/dev/null; then
	[ -z $TMUX ] && exec tmux
else
	echo "tmux not installed. Run ./deploy to configure dependencies"
fi

echo "Checking for updates"

(cd ~/dotfiles && git pull && git submodule update --init --recursive)
source ~/dotfiles/zsh/zshrc.sh
source ~/dotfiles/zsh/keybindings.sh
