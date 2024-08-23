#!/usr/bin/env bash

alias merge_main='merge_main'
alias gc='git_clone'
alias chk='git_checkout_branch'
alias push='git_push'
alias pull='git_pull'
alias add='git_add'
alias commit='git_commit_all'
alias fetch='git_fetch'
alias reset='git_reset'
alias reset_soft='git_reset_soft'
alias reset_hard='git_reset_hard'
alias revert='git_revert'

function merge_main(){
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD);
  git checkout main;
  git pull;
  git checkout $CURRENT_BRANCH;
  git merge main && return 0;
  return 1;
}

function git_clone(){
  [ -z "$1" ] && { printf "usage: gc <repo url> \n"; return 0;}
  git clone "$@" && return 0;
  return 1;
}

function git_checkout_branch(){
  [ -z "$1" ] && { printf "usage: chk <branch_name>\n"; return 0;}

  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD);

  if [[ "$1" == "$CURRENT_BRANCH" ]]; then
    printf "Already in $1\n";
    return 0;
  fi

  if git show-ref --quiet refs/heads/$1; then
    printf "$1 found, switching..\n";
    git checkout "$1" && return 0;
    return 1;
  fi

  if git ls-remote --heads origin "$1" | grep -q "$1"; then
    printf "$1 found on remote, switching..\n";
    git checkout -t origin/$1 && return 0;
    return 1;
  fi
  printf "$1 not found on remote or local!\n";
  printf "Creating new branch $1..\n";
  git checkout -b "$1" && return 0;
  return 1;
}

function git_push(){
  [ -z "$1" ] && {
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD);
    printf "Pushing to origin/$CURRENT_BRANCH..\n";
    git push origin "$CURRENT_BRANCH" && return 0; 
    return 1;  
  }
  git push "$@" && return 0;
  return 1;
}

function git_pull(){
  [ -z "$1" ] && {
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD);
    printf "Pulling from origin/$CURRENT_BRANCH..\n";
    git pull origin "$CURRENT_BRANCH" && return 0;
    return 1;  
  }
  git pull "$@" && return 0;
  return 1;
}

function git_add(){
  [ -z "$1" ] && {
    printf 'Staging all files..\n';
    git add . && return 0;
    return 1;
  }
  git add "$@" && return 0;
  return 1;
}

function git_commit_all(){
  [ -z "$1" ] && { printf "usage: commit 'message' \n"; return 0;}
  
if git diff --cached --exit-code > /dev/null; then
    printf "No staged files found, staging all files..\n";
    git add .;
  else
    printf "Staged files found..\n";
  fi
      CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD);
  printf "Committing to origin/$CURRENT_BRANCH..\n";
  git commit -m "$1" && return 0;
  return 1;
}

function git_fetch(){
  printf 'Fetching from origin..\n';
  git fetch && return 0;
  return 1;
}

function git_reset(){
  printf 'Resetting all uncommitted changes..\n';
  git reset --hard && return 0;
  return 1;
}

function git_reset_soft(){
  [ -z "$1" ] && {
    LAST_COMMIT=$(git rev-parse --short HEAD);
    printf "Soft resetting last commit $LAST_COMMIT..\n";
    git reset --soft HEAD~1 && return 0;
    return 1;
  }
  printf "Soft resetting last $1 commits..\n";
  git reset --soft HEAD~"$1" && return 0;
  return 1;
}

function git_reset_hard(){
  [ -z "$1" ] && {
    LAST_COMMIT=$(git rev-parse --short HEAD);
    printf "Hard resetting last commit $LAST_COMMIT..\n";
    git reset --hard HEAD~1 && return 0;
    return 1;
  }
  printf "Hard resetting last $1 commits..\n";
  git reset --hard HEAD~"$1" && return 0;
  return 1;
}

function git_revert(){
  [ -z "$1" ] && {
    LAST_COMMIT=$(git rev-parse --short HEAD);
    printf "No hash provided. Reverting latest commit $LAST_COMMIT..\n";
    git revert $LAST_COMMIT && return 0;
    return 1;
  }
  printf "Trying to revert commit $1..\n";
  git revert $1 && return 0;
  return 1;
}
