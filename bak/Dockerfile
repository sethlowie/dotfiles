FROM alpine

WORKDIR root

RUN apk update && \
	apk add \
		vim \
		tmux \
 		git && \
		git clone https://github.com/logiXbomb/dotfiles.git && \
		echo "source ~/dotfiles/vim/lite.vim" > .vimrc

