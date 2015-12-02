#
alias t='task ls'
alias tw='task week'
alias tn='task next'
alias tl='task list'
td(){
  task $1 done
}
ts(){
  task $1 start
}
tad(){
  task add $@ sched:today
}

tpp(){
  task $@ mod due sched:tomorrow
}
