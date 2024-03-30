#! /bin/bash

curl https://sh.rustup.rs -sSf | sh -s -- -y

. $HOME/.cargo/env

rustup override set stable
rustup update stable

rustup component add rustfmt --toolchain stable-x86_64-unknown-linux-gnu

