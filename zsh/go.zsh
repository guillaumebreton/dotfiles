#go path
export GOPATH="$WORKSPACE/go"

live(){
  pid_file="live.pid"
  kill_and_exec $1
  fswatch -0 -Ie *.go | while read -d "" event
    do
      kill_and_exec $1
    done
}

kill_and_exec() {
  cmd=$1
  if [ -f $pid_file ]; then
    pkill -F $pid_file
  fi
  make $cmd
}
