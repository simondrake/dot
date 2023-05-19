#!/bin/bash

if ! command -v rustup &> /dev/null
then
    echo "Install rustup (https://rustup.rs/) before running this script"
    exit 1
fi

## rust-analyzer
rustup component add rust-src
