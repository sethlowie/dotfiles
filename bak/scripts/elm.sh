#! /bin/bash

cd /tmp

wget https://github.com/elm/compiler/releases/download/0.19.0/binaries-for-linux.tar.gz

tar xvzf binaries-for-linux.tar.gz

sudo mv ./elm /usr/local/bin

npm i -g elm-format elm-oracle elm-live

