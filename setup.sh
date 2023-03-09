#!/bin/bash
# Install all the programs I normally use
set -euo pipefail

apt update
cat packages.list | xargs sudo apt install -y
