#! /bin/bash

cd /tmp

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraMono.zip

mkdir -p $HOME/.local/share/fonts/NerdFonts

unzip FiraMono.zip -d ~/.local/share/fonts/NerdFonts

fc-cache -f -v

