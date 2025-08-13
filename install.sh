#!/bin/bash

# This script is run by GitHub Codespaces when a new codespace is created.

echo "🚀 Starting personal dotfiles setup..."

# ---
# Install essential dependencies if they are not present
# ---
echo "📦 Installing dependencies (build-essential, ripgrep, etc.)..."
sudo apt-get update
sudo apt-get install -y curl build-essential ripgrep fd-find

# ---
# Install the latest stable Neovim
# We check if it's already installed to make the script idempotent (runnable multiple times)
# ---
if ! command -v nvim &> /dev/null
then
    echo "Installing latest Neovim..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    # We install it to a user-local directory
    mkdir -p ~/.local/bin
    mv nvim.appimage ~/.local/bin/nvim
else
    echo "✅ Neovim is already installed."
fi

# ---
# Install LazyVim configuration
# We check if the directory already exists
# ---
if [ ! -d ~/.config/nvim ]; then
    echo "⚙️ Cloning LazyVim starter configuration..."
    git clone https://github.com/LazyVim/starter ~/.config/nvim
else
    echo "✅ LazyVim configuration already exists."
fi

echo "🎉 Dotfiles setup complete!"
