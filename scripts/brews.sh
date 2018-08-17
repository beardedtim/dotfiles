#!/usr/bin/env bash

# Install needed tools
#
#

# Make sure we’re using the latest Homebrew.
brew update

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Brew-handled MacOS installs
brew install grep
brew install openssh

# Obvi
brew install git
brew install tree

# Easier Git
brew install hub

# sed for JSON data
brew install jq

# Helper Pkgs
brew install ack
brew install htop
brew install nmap
brew install watch

# fix commands
brew install thefuck

# Funsies
brew install fortune
brew install cowsay

# because Yarn is better than npm
# --without-node due to NVM handling node
brew install yarn --without-node

# More Brew-g
brew install cask
brew cask install iterm2
brew cask install slack
brew cask install google-chrome
# Remove outdated versions from the cellar.
brew cleanup
