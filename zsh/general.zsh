alias grep='grep --color=auto'
alias ls='ls -lhG'
alias fuck='sudo $(fc -ln -1)'
alias rm='trash'
alias m="make"
alias tf="terraform"

alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../../"
pwgen(){
  local size=${1:-10}
  pass=$(env LC_CTYPE=C tr -dc "a-zA-Z0-9" < /dev/urandom | head -c $size)
  echo $pass | pbcopy
  echo $pass
}

