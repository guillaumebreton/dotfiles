alias dm="docker-machine"
alias d="docker"
drme() { docker rm $(docker ps -qa --filter 'status=exited'); }
denv() { eval $(docker-machine env $1);}
drti() { docker run -ti $1 sh}
deti() { docker exec -ti $1 sh}
dri()  { docker rmi -f $(docker images -q --filter "dangling=true"); }
dl() {docker logs $1}
dlf() {docker logs -f $1}
alias dps="d ps"

