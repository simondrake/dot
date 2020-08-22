#!/bin/bash


  if ! command -v go &> /dev/null; then
    echo "Go is not installed"
    exit 1
  fi

# Install gofumpt
GO111MODULE=on go get mvdan.cc/gofumpt

