#!/bin/sh

sudo xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask gpg-suite-no-mail

mkdir ~/src/github.com/f10et
cd ~/src/github.com/f10et 

git clone https://github.com/f10et/dotfiles.git
cd ~
ln -s ~/src/github.com/f10et/dotfiles .dotfiles
