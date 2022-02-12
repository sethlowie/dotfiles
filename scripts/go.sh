#! /bin/bash

sudo apt-get update
sudo apt-get -y upgrade

GO_VERSION=1.17

cd /tmp
wget "https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz"
wget "https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz"


sudo tar -xvf "go$GO_VERSION.linux-amd64.tar.gz"
sudo mv go /usr/local
