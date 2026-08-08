#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# =============================================================
# bmilcs aliases
# =============================================================

# dotfiles ----------------------------------------------------

# git command
alias cfg='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# bash refresh aliases
alias alir='source $HOME/.bashrc'
alias alie='vim $HOME/.bashrc'

# terminal modifications --------------------------------------

# color modifications
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'

