export TERM="xterm-256color"

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

POWERLEVEL9K_CUSTOM_HOST="echo $HOST"
POWERLEVEL9K_CUSTOM_HOST_BACKGROUND="$chColor"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	custom_host
	dir
	vcs
)

