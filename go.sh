#!/bin/bash


if ! command -v go &> /dev/null; then
  echo "Go is not installed"
  exit 1
fi

echo "======================================"
echo "Installing gofumpt"
echo "======================================"

# Install gofumpt
go install mvdan.cc/gofumpt@latest

echo "======================================"
echo "Installing fillstruct"
echo "======================================"

# Install fillstruct
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest

echo "======================================"
echo "Installing golangci-lint"
echo "======================================"

# Install golangci-lint
# https://golangci-lint.run/usage/install/
brew install golangci-lint

echo "======================================"
echo "Installing golangci-lint-langserver"
echo "======================================"

# And golangci-lint-langserver
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1

echo "======================================"
echo "Installing gopls"
echo "======================================"

# Install gopls
go install golang.org/x/tools/gopls@latest

