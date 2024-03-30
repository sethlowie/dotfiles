#! /bin/bash

sudo apt-get install -y tmux

echo "source ~/dotfiles/tmux/tmux.conf" >> "$HOME/.tmux.conf"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
