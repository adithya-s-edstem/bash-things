alias merge_main='merge_main'
alias gc='git_clone'
alias chk='git_checkout_branch'
alias push='git_push'
alias pull='git_pull'
alias add='git_add'
alias commit='git_commit_all'
alias fetch='git_fetch'

function merge_main(){
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git checkout main
  git pull
  git checkout $CURRENT_BRANCH
  git merge main
}

function git_clone(){
  [ -z "$1" ] && { printf "usage: gc <repo url> \n"; return 1;}
  git clone "$@"
  return 0;
}

function git_checkout_branch(){
  [ -z "$1" ] && { printf "usage: chk <branch_name> \n"; return 1;}

  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

  if [[ "$1" == "$CURRENT_BRANCH" ]]; then
    printf "Already in $1 \n";
    return 0;
  fi

  if git show-ref --quiet refs/heads/$1; then
    printf "$1 found, switching..\n"
    git checkout "$1"
    return 0;
  fi
  
  git checkout -b "$1"
  return 0;
}

function git_push(){
  [ -z "$1" ] && { git push; return 0; }
  git push "$@"
  return 0;
}

function git_pull(){
  [ -z "$1" ] && { git pull; return 0; }
  git pull "$@"
  return 0;
}

function git_add(){
  [ -z "$1" ] && { git add .; return 0; }
  git add "$@"
  return 0;
}

function git_commit_all(){
  [ -z "$1" ] && { printf "usage: commit 'message' \n"; return 1;}
  git add .
  git commit -m "$1"
  return 0;
}

function git_fetch(){
  git fetch
  return 0;
}
