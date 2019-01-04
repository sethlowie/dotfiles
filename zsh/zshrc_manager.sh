if command -v tmux>/dev/null; then
	[ -z $TMUX ] && exec tmux
else
	echo "tmux not installed. Run ./deploy to configure dependencies"
fi

echo "waffles"
