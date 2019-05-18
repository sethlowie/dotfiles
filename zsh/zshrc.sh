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

shortKubeContext() {
	case "$(kubectl config current-context)" in
		"gke_fusion-dev-163815_us-east1-b_tonka-dev-cluster")
			echo "dev"
			;;
		"gke_platform-prod-156220_us-east1-d_tonka-production-cluster")
			echo "prod"
			;;
	esac
}

alias run-elm="elm-live src/Main.elm --open -- --output=elm.js --debug"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_CUSTOM_HOST="echo $HOST"
POWERLEVEL9K_CUSTOM_HOST_BACKGROUND="$chColor"
POWERLEVEL9K_CUSTOM_KUBECONTEXT="shortKubeContext"
POWERLEVEL9K_CUSTOM_KUBECONTEXT_BACKGROUND="red"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	custom_kubecontext
	dir
	vcs
)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
	command_execution_time
	time
)

# GO STUFF
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# NODE STUFF
export PATH=~/.npm-global/bin:$PATH

# VIM STUFF
alias vim=nvim
