shopt -s cdable_vars
export dev=$HOME/Documents/Development

HOME=/Documents/Development

rc() {
  cd $1
  ${HOME}/bash-scripts/git/git-delete-old-local-branches.sh
}

export -f ...

