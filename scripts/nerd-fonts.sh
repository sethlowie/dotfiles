#! /bin/bash

cd /tmp

git clone --depth 1 git@github.com:ryanoasis/nerd-fonts.git > /dev/null

cd nerd-fonts

./install.sh FiraCode > /dev/null
