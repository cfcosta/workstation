#!/bin/zsh

# Shell Configuration
set promptsubst

# Environment Variables
export RPROMPT="($SPIN)"
export EDITOR='nvim'
export SKIM_DEFAULT_COMMAND='rg --files'

# Aliases
alias ack='rg'
alias g='git status -s'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch --all --tags --prune'
alias gl='git log --graph'
alias gp='git push'
alias gs='git stash'
alias gsp='git stash pop'
alias ls='exa -l --git'
alias vim='nvim'
