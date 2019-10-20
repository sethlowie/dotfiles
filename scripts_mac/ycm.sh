#! /bin/bash

sudo apt-get install build-essential cmake python3-dev -y

cd ~/.vim/plugged/YouCompleteMe
python3 install.py --ts-completer --rust-completer --go-completer
