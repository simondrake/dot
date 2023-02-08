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
