shopt -s cdable_vars
export dev=$HOME/Documents/Development

HOME=/Documents/Development

rc() {
  cd $1
  ${HOME}/bash-scripts/git/git-delete-old-local-branches.sh
}

rc-clear-up-space() {
  # type "$1" &> /dev/null ;
  echo "clear up orphan dockers"
  docker rmi $(docker images | awk '{printf $3;}')
  echo "clear trash"
  rm -rf ~/.local/share/Trash/*
  journalctl --vacuum-size=200M
}

rc-ssh-list() {
  # working dir
  cat .../env-ssh.conf
}

rc-help(){
  clear 
  # figlet "Help!"
  echo "rc-clear-up-space: clear unused files"
}

rc-ssh() {
  SELECTION=$1
  IP=$(grep "${SELECTION}=" .../env-ssh.conf | cut -d ',' -f2
  echo "execute ${SSHKEY}${IP}"
  ssh ${SSHKEY}${IP}
}

rc-status() {
  clear; 
  # figlet "Status"
  echo "Status"
  docker ps | perl -ne '@cols=split/\s{2,}/, $_;printg "%30s %20s %20s\n", $cols[1], $col[2], $col[3], $col[4]'
  
}

rc-docker-stats() {
  docker system df
  docker stats --no-stream
}

export -f rc-help
export -f rc-ssh
export -f rc-ssh-list
export -f rc-clear-up-space
export -f find-


