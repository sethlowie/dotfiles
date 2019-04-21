#! /bin/bash

sudo wget -O /usr/local/bin/alacritty https://sync-tool.sfo2.cdn.digitaloceanspaces.com/alacritty > /dev/null

sudo chmod +x /usr/local/bin/alacritty > /dev/null

sudo wget -O /tmp/alacritty.desktop https://sync-tool.sfo2.cdn.digitaloceanspaces.com/alacritty.desktop > /dev/null

sudo desktop-file-install /tmp/alacritty.desktop > /dev/null

sudo update-desktop-database > /dev/null

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50 > /dev/null

