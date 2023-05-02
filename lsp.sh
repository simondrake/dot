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

if ! command -v go &> /dev/null; then
  echo "Go is not installed and is required to install some language servers"
  exit 1
fi

echo "======================================"
echo "Installing buf-language-server"
echo "======================================"

go install github.com/bufbuild/buf-language-server/cmd/bufls@latest
