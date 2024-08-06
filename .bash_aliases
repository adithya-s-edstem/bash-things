alias merge_main='merge_main'
alias gc='git_clone'

function merge_main(){
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git checkout main
  git pull
  git checkout $CURRENT_BRANCH
  git merge main
}

function git_clone(){
  [ -z "$1" ] && { printf "usage: gc <repo url>"; return 1;}
  git clone "$1"
  return 0
}
