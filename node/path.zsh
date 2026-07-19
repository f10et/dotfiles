if [ -d "$HOMEBREW_PATH/node@18/bin" ]; then
  export PATH="$HOMEBREW_PATH/node@18/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"

if [ -s "$HOMEBREW_PATH/nvm/nvm.sh" ]; then
  source "$HOMEBREW_PATH/nvm/nvm.sh"
fi

if [ -s "$HOMEBREW_PATH/nvm/etc/bash_completion.d/nvm" ]; then
  source "$HOMEBREW_PATH/nvm/etc/bash_completion.d/nvm"
fi

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
