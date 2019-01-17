#go path
export GOPATH="$WORKSPACE/go"

live(){
  exec_make $1
  fswatch -0 -i "*.go" -e "vendor/*" . | while read -d "" event
    do
      echo "{$event}"
      exec_make $1
    done
}

exec_make() {
  cmd=$1
  make $cmd
}

alias got="go test ./..."
alias goi="go install ."
alias gor="go run ."
alias gob="go build ."
