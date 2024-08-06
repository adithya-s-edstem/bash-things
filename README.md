# bash-things

Some scripts for WSL (Windows Subsystem for Linux).

## Installation
1. Copy .bash_aliases to root of WSL folder.

## Scripts

### 1. merge_main
`merge_main` is a simple alias for checking out to main, pulling latest and merging to your current branch.

**Why is it better than `git pull origin main` ?**

Keeps the local main branch updated instead of just the current branch. Also shorter.

### 2. gc
`gc` is an alias for `git clone 'url'`.