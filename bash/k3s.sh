#!/bin/bash

# Function to print a message
print_message() {
    echo "========================================"
    echo "$1"
    echo "========================================"
}

# Update the package list
print_message "Updating package list..."
sudo apt-get update

# Install required packages
print_message "Installing required packages..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
print_message "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker's APT repository
print_message "Adding Docker's APT repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package list again
print_message "Updating package list again..."
sudo apt-get update

# Install Docker CE
print_message "Installing Docker CE..."
sudo apt-get install -y docker-ce

# Enable and start Docker service
print_message "Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

# Add the current user to the docker group
print_message "Adding the current user to the docker group..."
sudo usermod -aG docker $USER

# Download and install Minikube``
print_message "Downloading and installing Minikube..."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo install minikube /usr/local/bin/

# Download and install kubectl
print_message "Downloading and installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo install kubectl /usr/local/bin/

# Start Minikube
print_message "Starting Minikube..."
minikube start

print_message "Installation complete! Docker and Minikube are now installed and running."`