if test ! "$(uname)" = "Darwin"
  then
  exit 0
fi

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

echo "› sudo softwareupdate -i -a"
#sudo softwareupdate -i -a

brew install tldr htop hub kubectx kube-ps1 krew

brew install --cask visual-studio-code \
  1password-cli \
  1password \
  firefox \
  microsoft-edge \
  google-cloud-sdk \
  jetbrains-toolbox \
  iterm2 \
  handbrake \
  shiftit \
  notion \
  spotify \
  slack \
  vlc \
  zoom
