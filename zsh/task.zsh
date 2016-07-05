#
alias t='task ls'
alias tw='task week'
alias tn='task next'
alias tl='task list'

te(){
  task $1 edit
}

td(){
  task $1 done
}

ts(){
  task $1 start
}

tad(){
  task add $@ sched:today
}

tp(){
  task $@ mod due: sched:tomorrow
}
