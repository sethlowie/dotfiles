#! /bin/bash

NODE_VERSION=14.x

cd ~
curl -sL "https://deb.nodesource.com/setup_$NODE_VERSION" -o nodesource_setup.sh

sudo bash nodesource_setup.sh
sudo apt install nodejs
