TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

source ~/dotfiles/zsh/gpg.zsh

source ~/dotfiles/zsh/zshrc.sh

# if command -v tmux>/dev/null; then
#	[ -z $TMUX ] && exec tmux new -s getit
# else
	# echo "tmux not installed. Run ./deploy to configure dependencies"
# fi

# echo "Checking for updates"

# (cd ~/dotfiles && git pull && git submodule update --init --recursive)
source ~/dotfiles/zsh/keybindings.sh

source ~/dotfiles/zsh/git.sh
source ~/dotfiles/zsh/common.sh
source ~/dotfiles/zsh/custom.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# alacrittyUpdate() {
	# cp ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml;
	# exit;
# }

ssh-add ~/.ssh/my_key 2> /dev/null
