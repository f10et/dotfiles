if [ -d "$HOMEBREW_PATH/ruby/bin" ]; then
  export PATH="$HOMEBREW_PATH/ruby/bin:$PATH"

  if (( $+commands[gem] )); then
    export PATH="$(gem environment gemdir)/bin:$PATH"
  fi
fi
