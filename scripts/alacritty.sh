#! /bin/bash

sudo wget -O /usr/local/bin/alacritty https://sync-tool.sfo2.cdn.digitaloceanspaces.com/alacritty 2> /dev/null

sudo chmod +x /usr/local/bin/alacritty 2> /dev/null

sudo wget -O /tmp/alacritty.desktop https://sync-tool.sfo2.cdn.digitaloceanspaces.com/alacritty.desktop 2> /dev/null

sudo desktop-file-install /tmp/alacritty.desktop 2> /dev/null

sudo update-desktop-database 2> /dev/null

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50 2> /dev/null

