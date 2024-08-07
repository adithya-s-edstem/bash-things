# bash-things

Some scripts originally written for WSL (Windows Subsystem for Linux). Should be compatible with any OS running a bash environment.

## Installation
1. Copy .bash_aliases to root of WSL folder.

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
  `chk` is an alias for `git checkout -b 'branch'`. If a branch already exists, `chk` won't fail like `git checkout -b` does, instead it'll switch to the existing branch.

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
  `push` is an alias for `git push`. Arguments passed to `push` will be passed as `git push arg1 arg2..argN`.

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
  `pull` is an alias for `git pull`. Arguments passed to `pull` will be passed as `git pull arg1 arg2..argN`.

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
