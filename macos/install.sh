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

brew install tldr htop hub kubectx kube-ps1

brew install --cask visual-studio-code \
  1password-cli \
  1password \
  calibre \
  goland \
  firefox \
  microsoft-edge \
  google-cloud-sdk \
  intellij-idea \
  iterm2 \
  handbrake \
  openvpn-connect \
  shiftit \
  notion \
  spotify \
  slack \
  fantastical \
  microsoft-office \
  vlc \
  zoom
