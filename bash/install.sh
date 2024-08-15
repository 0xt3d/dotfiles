#!/bin/bash

# Update the package list and upgrade installed packages
sudo apt update
sudo apt upgrade -y

# Install Neovim
sudo apt install neovim -y

# Install Tmux
sudo apt install tmux -y

# Install other essential CLI tools
sudo apt install -y \
    curl \
    wget \
    git \
    htop \
    vim \
    tree \
    ncdu \
    rsync \
    zsh \
    fzf \
    ripgrep \
    fd-find \
    bat \
    exa \
    jq \
    httpie \
    tldr \
    shellcheck

# Optionally, install Oh My Zsh for better Zsh experience
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "System updated and essential CLI tools installed successfully!"
