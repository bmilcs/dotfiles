# ~/.bashrc

#
# initialization
#

# if not running interactively, end
[[ $- != *i* ]] && return

# set locale all
export LC_ALL=en_US.UTF-8
bind 'set completion-ignore-case on'

# terminal prompt style
PS1="\[\033[0;36m\]\u\[\033[0m\]@\[\033[0;32m\]\h\[\033[0m\]:\[\033[0;35m\]\w\[\033[0m\]\$ "

# register global variables
source $HOME/.scripts/.global_variables

#
# aliases
#

# system & app updates
alias up='sudo pacman -Syu'
alias rb='reboot'
alias sd='shutdown -h now'

# dotfile git command replacement
alias cfg='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# dotfile editing & executing
alias cfgi='source $INSTALL_SCRIPT'
alias cfgr='source $HOME/.bashrc'
alias cfge='vim $INSTALL_SCRIPT'
alias cfgs='cfg status'
alias cfga='cfg add -u'
alias cfgp='cfg push'
alias cfgg='cfga && cfg commit -m'
alias cfgc='cfg commit -m '
alias cfgd='cfg diff'
alias ali='vim $HOME/.bashrc'
alias hypre='vim $HOME/.config/hypr'
alias vime='vim $HOME/.config/nvim/init.lua'
alias kittye='vim $HOME/.config/kitty'

# vim related
alias vim="nvim"
alias svim="sudo vim"

# misc
alias s="sudo"
alias rM="rm -rf"
alias sRM="sudo rm -rf"

#
# terminal modifications
#

# color mods
alias ls='ls -al --color=auto'
alias grep='grep --color=auto'

# Find this line and modify it:
case "$TERM" in
    xterm-color|*-256color|xterm-kitty) color_prompt=yes;;
esac

# env var for qt6 engine
QT_QPA_PLATFORMTHEME=hyprqt6engine
