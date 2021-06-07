alias dm="docker-machine"
alias dc="docker-compose"
alias d="docker"

dip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1
}

drme() { docker rm $(docker ps -qa --filter 'status=exited'); }
drm() { docker rm $(docker ps -qa); }

denv() { eval $(docker-machine env $1);}
denv-swarm() { eval $(docker-machine env --swarm $1);}

drti() { docker run -ti $1 sh}

deti() { docker exec -ti $1 sh
}
dri()  { docker rmi -f $(docker images -q --filter "dangling=true"); }
dl() {docker logs $1}
dlf() {docker logs -f $1}
alias dps="d ps"
alias dpsa="d pas -a"

alias k="kubectl"
