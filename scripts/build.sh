#!/bin/bash

set -e

ansible-lint

rm -rf dist/*

ansible-galaxy \
  collection \
  build \
  --force \
  --output-path dist/
