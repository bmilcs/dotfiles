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

# system & app updates
alias up='sudo pacman -Syu'

# dotfile git command replacement
alias cfg='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# dotfile editing & executing
alias cfgi='source $INSTALL_SCRIPT'
alias cfge='vim $INSTALL_SCRIPT'
alias cfgr='source $HOME/.bashrc'
alias cfgs='cfg status'
alias cfga='cfg add -u'
alias cfgp='cfg push'
alias cfgg='cfga && cfg commit -m'
alias ali='vim $HOME/.bashrc'
alias hypre='vim $HOME/.config/hypr/hyprland.lua'

# vim related
alias svim="sudo vim"

#
# terminal modifications
#

# color mods
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'

# Find this line and modify it:
case "$TERM" in
    xterm-color|*-256color|xterm-kitty) color_prompt=yes;;
esac
