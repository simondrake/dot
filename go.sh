#!/bin/bash


if ! command -v go &> /dev/null; then
  echo "Go is not installed"
  exit 1
fi

# Install gofumpt
go install mvdan.cc/gofumpt@latest

# Install fillstruct
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest

# Install golangci-lint
# https://golangci-lint.run/usage/install/
brew install golangci-lint

# And golangci-lint-langserver
go install github.com/nametake/golangci-lint-langserver@install
