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

brew install tldr htop hub kubectx kube-ps1 krew starship

brew install --cask visual-studio-code \
  1password \
  arc \
  google-cloud-sdk \
  jetbrains-toolbox \
  iterm2 \
  obsidian \
  handbrake \
  rectangle \
  notion \
  slack \
  orbstack \
  krisp \
  linear-linear \
  raycast \
  superhuman \
  figma \
  sonos \
  vlc \
  zoom
