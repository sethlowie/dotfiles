#! /bin/bash

cd /tmp
git clone git@github.com:jwilm/alacritty.git
cd alacritty

sudo apt-get install -y \
	cmake \
	pkg-config \
	libfreetype6-dev \
	libfontconfig1-dev \
	xclip

/home/slowie/.cargo/bin/cargo build --release

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo desktop-file-install alacritty.desktop
sudo update-desktop-database

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50

