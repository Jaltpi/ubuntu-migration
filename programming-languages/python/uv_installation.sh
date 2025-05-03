#!/bin/bash

# This script installs Docker on a Linux system.
# It is designed to be run as a root user or with sudo privileges.
# It is recommended to run this script on a fresh installation of Ubuntu 22.04 LTS.
# The script will:
# 1. Update the package index.
# 2. Install required packages.

# Set up Docker's apt repository.
echo "Setting up uv dependencies..."
apt-get update

# Install required packages.
echo "Installing required packages..."
apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https \
    systemctl

echo "Running uv installation script..."
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "uv installation complete."
echo "uv is installed. You can run 'uv' to start using it."
echo "uv is installed in /usr/local/bin/uv."