#! /bin/sh
#
alias t='task ls'
alias tw='task week'
alias tn='task next'
alias tl='task list'
td(){
  task $1 done
}

tad(){
  task add $@ due:today sched:today
}
