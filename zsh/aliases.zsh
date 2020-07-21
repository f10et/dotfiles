alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command
alias kubetoken="kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | awk '/^deployment-controller-token-/{print $1}') | awk '$1==\"token:\"{print $2}'"
alias nspr='cd ~/code/src/github.com/nspr-io/weteachbackend/'
alias buildns='kubectl config set-context --current --namespace=build'
alias nsprns='kubectl config set-context --current --namespace=io-nspr'
