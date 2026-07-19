#!/usr/bin/env bash

dotfiles_root() {
  cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P
}

DOTFILES_ROOT="${DOTFILES_ROOT:-$(dotfiles_root)}"
DOTFILES_CONFIG_HOME="${DOTFILES_CONFIG_HOME:-${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles}"
DOTFILES_ENABLED_FILE="${DOTFILES_ENABLED_FILE:-$DOTFILES_CONFIG_HOME/enabled}"

dotfiles_profile_path() {
  printf '%s/profiles/%s\n' "$DOTFILES_ROOT" "$1"
}

dotfiles_is_module() {
  local module="$1"

  [ -d "$DOTFILES_ROOT/$module" ] || return 1
  find "$DOTFILES_ROOT/$module" -maxdepth 1 \( -name '*.zsh' -o -name '*.symlink' -o -name 'install.sh' \) | grep -q .
}

dotfiles_available_modules() {
  local dir module

  for dir in "$DOTFILES_ROOT"/*; do
    [ -d "$dir" ] || continue
    module="$(basename "$dir")"
    dotfiles_is_module "$module" && printf '%s\n' "$module"
  done | sort
}

dotfiles_read_profile() {
  local profile="$1"
  local profile_path

  profile_path="$(dotfiles_profile_path "$profile")"
  [ -f "$profile_path" ] || {
    printf 'Unknown profile: %s\n' "$profile" >&2
    return 1
  }

  sed -e 's/#.*//' -e '/^[[:space:]]*$/d' "$profile_path"
}

dotfiles_enabled_modules() {
  if [ -f "$DOTFILES_ENABLED_FILE" ]; then
    sed -e 's/#.*//' -e '/^[[:space:]]*$/d' "$DOTFILES_ENABLED_FILE"
  else
    dotfiles_read_profile default
  fi
}

dotfiles_unique_modules() {
  awk '!seen[$0]++'
}

dotfiles_validate_modules() {
  local module

  for module in "$@"; do
    if ! dotfiles_is_module "$module"; then
      printf 'Unknown module: %s\n' "$module" >&2
      return 1
    fi
  done
}

dotfiles_resolve_modules() {
  local mode="modules"

  if [ "$#" -eq 0 ]; then
    dotfiles_enabled_modules | dotfiles_unique_modules
    return
  fi

  if [ "${1:-}" = "profile" ]; then
    mode="profile"
    shift
  fi

  if [ "$mode" = "profile" ]; then
    [ "$#" -gt 0 ] || {
      printf 'Missing profile name.\n' >&2
      return 1
    }

    dotfiles_read_profile "$1" | dotfiles_unique_modules
    return
  fi

  dotfiles_validate_modules "$@" || return 1
  printf '%s\n' "$@" | dotfiles_unique_modules
}

dotfiles_write_enabled() {
  mkdir -p "$DOTFILES_CONFIG_HOME"
  printf '%s\n' "$@" > "$DOTFILES_ENABLED_FILE"
}

dotfiles_contains_module() {
  local needle="$1"
  shift

  local module
  for module in "$@"; do
    [ "$module" = "$needle" ] && return 0
  done

  return 1
}
