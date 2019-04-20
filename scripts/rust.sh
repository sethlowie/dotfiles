#! /bin/bash

curl https://sh.rustup.rs -sSf | sh

rustup override set stable
rustup update stable

