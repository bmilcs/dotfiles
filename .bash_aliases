# system updates & upgrades
alias up='sudo apt update -y && sudo apt upgrade =y'
alias upp='up && sudo dist-upgrade -y'

# ls
alias l='ls'

# ls: long form
alias ls='LC_ALL=C ls -AlhF --color=auto --group-directories-first \
  --time-style="+%D %H:%M"'

# ls: condensed form
alias ll='LC_ALL=C command ls -AC --color=auto --group-directories-first \
  --time-style="+%D %H:%M"'

# ls: sort by modified
alias lst='l -tr'

# ls: grep output
alias lsg='l | grep'

# ls: only directories
alias lsd='l -d */' # only dirs

# rm: -rf verbose
alias rM='rm -rfv'

# colorize
alias ip='ip -color=auto'
alias ipa='ip -brief a'
alias grep='grep --color=auto'

# autoresume wget
alias wget='wget -c'

# confirmations
alias ln='ln -i'
alias cp='cp -v'
alias mv='mv -v'

# sudo'ified
alias s='sudo'
alias srm='s rM'
alias srmd='s rmdir'
alias smv='s mv'

# navigation
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'

# rscp & rsync
alias rscp='rsync -zahv --progress --partial'
alias rsmv='rscp -zahv --progress --remove-source-files'
