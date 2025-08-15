#!/bin/sh

sudo xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask gpg-suite-no-mail
softwareupdate --install-rosetta --agree-to-license
mkdir -p ~/src/github.com/f10et
cd ~/src/github.com/f10et 

git clone https://github.com/f10et/dotfiles.git
cd ~
ln -s ~/src/github.com/f10et/dotfiles ~/.dotfiles

cd  ~/src/github.com/f10et/dotfiles

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/f10et/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

script/bootstrap
script/install
