#! /bin/bash

sudo apt-get update
sudo apt-get -y upgrade

cd /tmp
wget https://dl.google.com/go/go1.12.linux-amd64.tar.gz

sudo tar -xvf go1.12.linux-amd64.tar.gz
sudo mv go /usr/local
