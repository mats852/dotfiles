#!/bin/bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# ----- Apps -----
eval "$(starship init bash)"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)


# ----- Configs -----
alias ll="ls -alF"

# GnuPG
export GPG_TTY=$(tty)

# Keyboard Speed
xset r rate 225 75

# NPM TOKEN
export NPM_TOKEN=""

# ----- PATH stuff -----
# NVM 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust
export PATH=$PATH:$HOME/.cargo/env

# Deno
export DENO_INSTALL="/home/mats/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# ----- Git configs -----

# Autocompletion
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash

# Aliases
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gps='git push'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

# Git search by commit message
function glf() { git log --all --grep="$1"; }
