#! /bin/bash

# sudo wget -O /usr/local/bin/alacritty https://sync-tool.sfo2.cdn.digitaloceanspaces.com/alacritty

# sudo chmod +x /usr/local/bin/alacritty

# sudo wget -O /tmp/alacritty.desktop https://sync-tool.sfo2.cdn.digitaloceanspaces.com/alacritty.desktop

# sudo desktop-file-install /tmp/alacritty.desktop

# sudo update-desktop-database

# sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50

brew cask install alacritty

cd ~/.config/alacritty

mv alacritty.yml alacritty.yml.bak

ln ~/dotfiles/alacritty/mac.yml alacritty.yml
