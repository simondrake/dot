#!/bin/bash

echo "======================================"
echo "Installing terraform-ls"
echo "======================================"

# Terraform language server
brew install hashicorp/tap/terraform-ls

echo "======================================"
echo "Installing lua-language-server"
echo "======================================"

# Lua language server
brew install lua-language-server

echo "======================================"
echo "Installing shellcheck"
echo "======================================"

# Shellcheck language server
brew install shellcheck

if ! command -v go &>/dev/null; then
    echo "Go is not installed and is required to install some language servers"
    exit 1
fi

echo "======================================"
echo "Installing buf-language-server"
echo "======================================"

go install github.com/bufbuild/buf-language-server/cmd/bufls@latest

echo "======================================"
echo "Installing codespell"
echo "======================================"

sudo pip install codespell

echo "======================================"
echo "Installing stylua"
echo "======================================"

brew install stylua

echo "======================================"
echo "Installing golines"
echo "======================================"

go install github.com/segmentio/golines@latest

echo "======================================"
echo "Installing prettier"
echo "======================================"

npm install --save-dev --save-exact prettier

echo "======================================"
echo "Installing shfmt"
echo "======================================"

go install mvdan.cc/sh/v3/cmd/shfmt@latest

echo "======================================"
echo "Installing Shellharden"
echo "======================================"

cargo install shellharden

echo "======================================"
echo "Installing prettierd"
echo "======================================"

npm install -g @fsouza/prettierd

echo "======================================"
echo "Installing gci"
echo "======================================"

go install github.com/daixiang0/gci@latest
