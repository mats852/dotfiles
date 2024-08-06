#!/bin/bash

# ----- Configs -----
# GnuPG
export GPG_TTY=$(tty)

# Keyboard Speed
if [ -x "$(command -v xset)" ]; then
  xset r rate 225 75
fi

alias ll="ls -alF"


# ----- PATH stuff -----
export PATH="$PATH:$HOME/.local/scripts"


# ----- Git configs -----

# Autocompletion
if [ ! -f ~/.git-completion.bash ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi
. ~/.git-completion.bash

# Aliases
alias ga='git add'
__git_complete ga _git_add
alias gaa='git add .'
__git_complete gaa _git_add
alias gaaa='git add --all'
__git_complete gaaa _git_add
alias gau='git add --update'
__git_complete gau _git_add
alias gb='git branch'
__git_complete gb _git_branch
alias gbd='git branch --delete '
__git_complete gb _git_branch
alias gc='git commit'
__git_complete gc _git_commit
alias gcm='git commit --message'
__git_complete gcm _git_commit
alias gcf='git commit --fixup'
__git_complete gcf _git_commit
alias gco='git checkout'
__git_complete gco _git_checkout
alias gd='git diff'
__git_complete gd _git_diff
alias gda='git diff HEAD'
__git_complete gda _git_diff
alias gf='git fetch --all --progress --prune'
__git_complete gda _git_fetch
alias gi='git init'
alias glg='git log --graph --oneline --decorate'
__git_complete glg _git_log
alias gm='git merge --no-ff'
__git_complete gm _git_merge
alias gma='git merge --abort'
__git_complete gma _git_merge
alias gmc='git merge --continue'
__git_complete gmc _git_merge
alias gp='git pull'
__git_complete gp _git_pull
alias gpr='git pull --rebase'
__git_complete gpr _git_pull
alias gps='git push'
__git_complete gps _git_push
alias gr='git rebase'
__git_complete gr _git_rebase
alias gs='git status'
__git_complete gs _git_status
alias gss='git status --short'
__git_complete gss _git_status
alias gst='git stash'
__git_complete gst _git_stash
alias gsta='git stash apply'
__git_complete gsta _git_stash
alias gstd='git stash drop'
__git_complete gstd _git_stash
alias gstl='git stash list'
__git_complete gstl _git_stash
alias gstp='git stash pop'
__git_complete gstp _git_stash
alias gsts='git stash save'
__git_complete gsts _git_stash

function gl() { git log --oneline ^$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@') HEAD; }
__git_complete gl _git_log

# Git search by commit message
function glf() { git log --all --grep="$1"; }

# Git create branch and set upstream
function gcob() { git checkout -b $1 && git push --set-upstream --no-verify origin $1; }
__git_complete gcob _git_checkout

# Get branch original commit hash
# Useful for interactive rebase "squash": git rebase -i $(gboh)
function gboh { git reflog show --no-abbrev $(git rev-parse --abbrev-ref HEAD) --format='%H' |tail -n 1; }
