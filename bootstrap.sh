#!/usr/bin/env bash

set -euo pipefail

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/f10et/dotfiles.git}"
DOTFILES_PROFILE="${DOTFILES_PROFILE:-default}"
DOTFILES_PARENT="${DOTFILES_PARENT:-$HOME/src/github.com/f10et}"
DOTFILES_DIR="${DOTFILES_DIR:-$DOTFILES_PARENT/dotfiles}"

if [ "$(uname -s)" = "Darwin" ]; then
  xcode-select --install 2>/dev/null || true

  if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if command -v brew >/dev/null 2>&1; then
    brew install --cask gpg-suite-no-mail || true
  fi

  softwareupdate --install-rosetta --agree-to-license 2>/dev/null || true
else
  # Linux
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
fi

mkdir -p "$DOTFILES_PARENT"

if [ -d "$DOTFILES_DIR/.git" ]; then
  git -C "$DOTFILES_DIR" pull --ff-only
else
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

ln -sfn "$DOTFILES_DIR" "$HOME/.dotfiles"

cd "$DOTFILES_DIR"

if [ "$(uname -s)" = "Darwin" ] && command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
fi

PATH="/home/linuxbrew/.linuxbrew/bin/:$PATH" script/bootstrap profile "$DOTFILES_PROFILE"
PATH="/home/linuxbrew/.linuxbrew/bin/:$PATH" script/install profile "$DOTFILES_PROFILE"
