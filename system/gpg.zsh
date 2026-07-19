export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"

if (( $+commands[gpg-agent] )); then
  gpg-agent --daemon &> /dev/null
fi
