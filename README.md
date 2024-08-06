# bash-things

Some scripts for WSL (Windows Subsystem for Linux).

## Installation
1. Copy .bash_aliases to root of WSL folder.

## Index
- [merge_main](#1-merge_main)
- [gc](#2-gc)
- [brn](#3-brn)
- [push](#4-push)
- [pull](#5-pull)
- [commit](#6-commit)

## Scripts

- ### 1. merge_main
`merge_main` is a simple alias for checking out to main, pulling latest and merging to your current branch.

**Why is it better than `git pull origin main` ?**

Keeps the local main branch updated instead of just the current branch. Also shorter.

- ### 2. gc
`gc` is an alias for `git clone 'url'`.

- ### 3. brn
`brn` is an alias for `git checkout -b 'branch'`.

- ### 4. push
`push` is an alias for `git push` with two optional arguments passed in order (`git push arg1 arg2`).

- ### 5. pull
`pull` is an alias for `git pull` with two optional arguments passed in order (`git pull arg1 arg2`).

- ### 6. commit
`commit` is an alias for committing all changes with a message.

**Usage**

`commit 'message'`
