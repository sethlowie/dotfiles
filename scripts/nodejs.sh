#! /bin/bash

sudo apt-get install nodejs npm -y

mkdir ~/.npm-global

npm config set prefix '~/.npm-global'

