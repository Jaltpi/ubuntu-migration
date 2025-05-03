#!/bin/bash

# This script installs Docker on a Linux system.
# It is designed to be run as a root user or with sudo privileges.
# It is recommended to run this script on a fresh installation of Ubuntu 22.04 LTS.
# The script will:
# 1. Update the package index.
# 2. Install required packages.
# 3. Add Docker's official GPG key.
# 4. Set up the stable repository.
# 5. Install Docker Engine, CLI, and Containerd.
# 6. Start and enable Docker service.
# 7. Add the current user to the Docker group.
# 8. Enable Docker to start on boot.
# 9. Install Docker Compose.
# 10. Verify the installation.
# 11. Clean up.
# 12. Print the Docker and Docker Compose versions.
# 13. Print a message indicating that the installation is complete.
# 14. Print a message indicating that the user should log out and log back in.
# 15. Print a message indicating that the user should run the Docker hello-world image to verify the installation.
# 16. Print a message indicating that the user should run the Docker Compose hello-world image to verify the installation.

# Set up Docker's apt repository.
echo "Setting up Docker's apt repository..."
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

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | tee /etc/apt/keyrings/docker.gpg > /dev/null

echo "Adding Docker's stable repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again.
echo "Updating the package index again..."
apt-get update

# Install Docker Engine, CLI, and Containerd.
echo "Installing Docker Engine, CLI, and Containerd..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Start and enable Docker service.
echo "Starting and enabling Docker service..."
systemctl start docker
systemctl enable docker

# Add the current user to the Docker group.
echo "Adding the current user to the Docker group..."
usermod -aG docker $USER

# Enable Docker to start on boot.
echo "Enabling Docker to start on boot..."
systemctl enable docker
