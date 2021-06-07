#
alias t='task ls'
alias tw='task week'
alias tn='task next'
alias tl='task list'

te(){
  task $1 edit
}

td(){
  task $1 mod sched:today
}

ts(){
  task $1 start
}

tt(){
  task $1 mod sched:$2
}
tad(){
  task add $@ sched:today
}

tp(){
  task $@ mod due: sched:tomorrow
}

