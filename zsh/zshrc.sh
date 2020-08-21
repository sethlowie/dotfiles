zplug "dracula/zsh", as:theme

export TERM="screen-256color"
export BAT_THEME="Dracula"

# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="dracula"

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

alias run-elm="elm-live src/Main.elm --open -- --output=elm.js --debug"

# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_CUSTOM_HOST="echo $HOST"
# POWERLEVEL9K_CUSTOM_HOST_BACKGROUND="$chColor"
# POWERLEVEL9K_CUSTOM_KUBECONTEXT="shortKubeContext"
# POWERLEVEL9K_CUSTOM_KUBECONTEXT_BACKGROUND="red"

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	# custom_kubecontext
	# dir
	# vcs
# )

# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
	# command_execution_time
	# time
# )

# GO STUFF
# export GOROOT=/usr/local/bin
# export GOROOT="$(brew --prefix golang)/libexec"
export GOPATH=$HOME/go
# export GOROOT=$GOPATH
export PATH=$GOPATH/bin:$PATH

# Fix Go because it's terrible
export GO111MODULE=on

# NODE STUFF
export PATH=~/.npm-global/bin:$PATH

# VIM STUFF
alias vim=nvim
alias evrc="vim ~/dotfiles/vim/vimrc.vim"

# GIT STUFF
git config --global core.editor "nvim"

export CBROOT=/Applications/Couchbase\ Server.app/Contents/Resources/couchbase-core/bin

export PATH=$PATH:$CBROOT:$CBROOT/tools:$CBROOT/intall

alias clear-swap="rm ~/.local/share/nvim/swap/* -y"

function gmb() {
  git branch -r | xargs -L1 git --no-pager show -s --oneline --author="$(git config user.name)";
}
