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

brew install --cask 1password \
  arc \
  cursor \
  google-cloud-sdk \
  jetbrains-toolbox \
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
  vlc
