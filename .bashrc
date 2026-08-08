# ~/.bashrc

#
# initialization
#

# if not running interactively, end
[[ $- != *i* ]] && return

# terminal prompt style
PS1='[\u@\h \W]\$ '

# register global variables
source $HOME/.scripts/.global_variables

#
# aliases
#

# dotfile git command replacement
alias cfg='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# dotfile editing & executing
alias cfgi='source $INSTALL_SCRIPT'
alias cfge='vim $INSTALL_SCRIPT'
alias cfgr='source $HOME/.bashrc'
alias ali='vim $HOME/.bashrc'
alias hypre='vim $HOME/.config/hypr/hyprland.lua'

#
# terminal modifications
#

# color mods
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'

