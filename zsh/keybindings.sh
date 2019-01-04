# git stuff
function git_commit_push{
	if [ -n "$BUFFER" ]; then
		BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
	fi

	if [ -z "$BUFFER" ]; then
		BUFFER="git add -A && git commit -v && git push"
	fi
	
	zle accept-line
}
zle -N git_commit_push
bindkey "^g" git_fancy_commit
