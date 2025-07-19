# bash-things

Some scripts originally written for WSL (Windows Subsystem for Linux). Should be compatible with any OS running a bash environment.

_README (WIP)_

## Installation

### WSL

1. Copy .bash_aliases to root of WSL folder (`~`).

### Any other bash environment

- If you already have a .bash_aliases file, copy the contents from here to the end of the existing file..
- If you don't have one, copy this to root, add `source ~/.bash_aliases` to the end of your `.bashrc` file.

_Compatibility with other shells (zsh, fsh, etc.) haven't been tested_

## Chaining commands

All scripts return an error value, you can chain multiple commands to save time.

- eg: Merge all changes from main and push
  ```
  merge_main && push
  ```

## Index

- [merge_main](#merge_main)
- [gc](#gc)
- [chk](#chk)
- [push](#push)
- [pull](#pull)
- [add](#add)
- [commit](#commit)
- [fetch](#fetch)
- [reset](#reset)
- [reset_soft](#reset_soft)
- [reset_hard](#reset_hard)
- [revert](#revert)

## Scripts

- ### merge_main

  `merge_main` is a simple alias for checking out to main, pulling latest and merging to your current branch.

  **Why is it better than `git pull origin main`?**

  Keeps the local main branch updated instead of just the current branch. Also shorter.

- ### gc

  `gc` is an alias for `git clone 'url'`. Arguments passed to `gc` will be passed as `git clone url arg1 arg2..argN`

  **Usage**

  - Clone exampleRepo:

    ```
    gc http://github.com/example/exampleRepo
    ```

  - Clone exampleRepo with a depth of 1:
    ```
    gc http://github.com/example/exampleRepo --depth=1
    ```

- ### chk

  `chk` is an alias for `git checkout [-b] 'branch'`. `chk` can check if a branch already exists in either the local repository or the remote repository. If a branch already exists, it'll switch to the existing branch and pull if it's a remote one. **No more confusion between -b or not**.

  **Usage**

  - Switch to main branch:

    ```
    chk main
    ```

  - Create and switch to newBranch if newBranch is not already made:
    ```
    chk newBranch
    ```

- ### push

  `push` without arguments is an alias for `git push origin $CURRENT_BRANCH`. Arguments passed to `push` will be passed as `git push arg1 arg2..argN`.

  **Usage**

  - Push to current remote branch:

    ```
    push
    ```

  - Push to remote main:
    ```
    push origin main
    ```

- ### pull

  `pull` without arguments is an alias for `git pull origin $CURRENT_BRANCH`. Arguments passed to `pull` will be passed as `git pull arg1 arg2..argN`.

  **Usage**

  - Pull the current branch:

    ```
    pull
    ```

  - Pull from remote main:
    ```
    pull origin main
    ```

- ### add

  `add` is an alias for `git add .` If no arguments are provided, `add` will stage all files. Arguments passed to `add` will be passed as `git add arg1 arg2..argN`

  **Usage**

  - Stage all files:

    ```
    add
    ```

  - Stage selected files:
    ```
    add fileName.html fileName.css
    ```

- ### commit

  `commit` will check if any files are staged and commits them with a message. If no files are staged, `commit` will stage all files and commit them.

  **Usage**

  ```
  commit 'Commit Message'
  ```

- ### fetch

  `fetch` is an alias for `git fetch`. Fetch doesn't take any arguments for now.

- ### reset

  `reset` is an alias for `git reset --hard`.

- ### reset_soft

  `reset_soft` is an alias for `git reset --soft HEAD~1`.

  **Usage**

  - Soft reset last commit:

    ```
    reset_soft
    ```

  - Soft reset last 5 commits:
    ```
    reset_soft 5
    ```

- ### reset_hard

  `reset_hard` is an alias for `git reset --hard HEAD~1`.

  **Usage**

  - Hard reset last commit:

    ```
    reset_hard
    ```

  - Hard reset last 5 commits:
    ```
    reset_hard 5
    ```

- ### revert

  `revert` is a wrapper for `git revert`. If no hash is provided, it will revert the last commit.

  **Usage**

  - Revert last commit:
    ```
    revert
    ```
  - Revert a particular commit
    ```
    revert 39dd6b0
    ```
