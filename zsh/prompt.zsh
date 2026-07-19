export STARSHIP_CONFIG="$ZSH/starship.toml"

if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
  return
fi

autoload colors && colors

if ! (( $+commands[git] )); then
  export PROMPT=$'\n%{$fg_bold[cyan]%}%/%{$reset_color%}\n> '
  return
fi

git_prompt_info() {
  local ref
  ref="$(git symbolic-ref HEAD 2>/dev/null)" || return
  echo "${ref#refs/heads/}"
}

git_dirty() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  if [[ "$(git status --porcelain)" == "" ]]; then
    echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
  else
    echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%/%\/%{$reset_color%}"
}

export PROMPT=$'\n$(directory_name) $(git_dirty)\n> '
