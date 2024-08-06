alias merge_main='merge_main'
alias gc='git_clone'
alias brn='git_checkout_branch'
alias push='git_push'
alias pull='git_pull'

function merge_main(){
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git checkout main
  git pull
  git checkout $CURRENT_BRANCH
  git merge main
}

function git_clone(){
  [ -z "$1" ] && { printf "usage: gc <repo url> \n"; return 1;}
  git clone "$1"
  return 0;
}

function git_checkout_branch(){
  [ -z "$1" ] && { printf "usage: brn <branch_name> \n"; return 1;}
  git checkout -b "$1"
  return 0;
}

function git_push(){
  [ -z "$1" ] && git push
  [ -z "$2" ] && git push "$1"
  git push "$1" "$2"
}

function git_pull(){
  [ -z "$1" ] && git pull
  [ -z "$2" ] && git pull "$1"
  git pull "$1" "$2"
}
