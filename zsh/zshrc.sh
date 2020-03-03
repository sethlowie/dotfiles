export TERM="screen-256color"

case "$HOST" in
	"learn-elixir")
		chColor="105"
		;;
	"work")
		chColor="red"
		;;
	*)
		chColor="green"
		;;
esac

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

alias run-elm="elm-live src/Main.elm --open -- --output=elm.js --debug"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_CUSTOM_HOST="echo $HOST"
POWERLEVEL9K_CUSTOM_HOST_BACKGROUND="$chColor"
# POWERLEVEL9K_CUSTOM_KUBECONTEXT="shortKubeContext"
POWERLEVEL9K_CUSTOM_KUBECONTEXT_BACKGROUND="red"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	# custom_kubecontext
	dir
	vcs
)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
	command_execution_time
	time
)

# GO STUFF
export GOROOT=/usr/local/go
# export GOROOT="$(brew --prefix golang)/libexec"
export GOPATH=$HOME/go
# export GOROOT=$GOPATH
export PATH=$GOPATH/bin:$GOROOT:$GOROOT/bin:$PATH

# Fix Go because it's terrible
export GO111MODULE=on

# NODE STUFF
export PATH=~/.npm-global/bin:$PATH

# VIM STUFF
alias vim=nvim

# GIT STUFF
git config --global core.editor "nvim"

# Couchbase
function cb {
  curl -v http://localhost:8091/_p/query/query/service \
    -H "Content-Type: application/json" \
    -d '{ "statement": "'$1'" }' \
    -u cpapi:password | jq '.results' > ~/.couchbase/$1.json

  nvim ~/.couchbase/$1.json
  }
