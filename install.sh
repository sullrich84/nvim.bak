#!/bin/bash

REPOSITORY=git@github.com:sullrich84/nvim.git
TARGET=~/.config/nvim
TIMESTAMP=$(date "+%Y-%m-%d_%H:%M:%S")

# Check if brew is installed
if ! command -v brew &>/dev/null; then
	echo "Error: Homebrew is not installed. Please install Homebrew before running this script."
	exit 1
fi

# Check if git is installed
if ! command -v git &>/dev/null; then
	echo "Error: Git is not installed. Please install Git before running this script."
	exit 1
fi

function install_or_upgrade {
	if brew ls --version "$1" >/dev/null; then
		HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade "$1"
	else
		HOMEBREW_NO_AUTO_UPDATE=1 brew install "$1"
	fi
}

# Clear cache
rm -rf ~/.local/share/nvim || true

# Backup old config
mv "$TARGET" "$TARGET.$TIMESTAMP"
echo "Your config has been backed up at $TARGET.$TIMESTAMP!"

# Checkout configuration
git clone $REPOSITORY --depth 1 $TARGET

# Install or upgrade dependencies
install_or_upgrade nvim
install_or_upgrade typescript-language-server
install_or_upgrade vscode-langservers-extracted
install_or_upgrade lazygit
install_or_upgrade fzf
