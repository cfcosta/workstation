#!/bin/zsh

# Shell Configuration
set promptsubst

# Environment Variables
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

# PROMPT
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

PROMPT='%{$fg[cyan]%}$SPIN%{$reset_color%} ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
