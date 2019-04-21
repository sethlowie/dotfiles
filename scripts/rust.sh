#! /bin/bash

curl https://sh.rustup.rs -sSf | sh -y

. $HOME/.cargo/env

rustup override set stable
rustup update stable

