# shortcuts: dotfile related
alias ali="vim ~/.bash_aliases"
alias brc="vim ~/.bashrc"
alias brs="source ~/.bashrc"
alias dfi="(cd $DOT && ./install.sh)"
alias dfe="vim $DOT/install.sh"
alias i3e="vim $DOT/i3/.config/i3/config"

# ssh keygen
alias sshgen="ssh-keygen -t ed25519 -C bmilcs@yahoo.com"

# vim
alias vim="lvim"

# git
alias gpp='if [ -z "$(git status --porcelain)" ]; then \
            npm run build && \
            git add -A && \
            git commit -m "Build updates to dist/" && \
            git push && \
            git subtree push --prefix dist origin dist; \
          fi'
alias gs='git status'
alias gd='git diff'
alias gp='git push'
alias gf='git fetch'
alias gds='git diff --staged'
alias gcm='git commit -m'
alias ga='git add'
alias gaa='ga --all'
alias gl='git log --oneline'

# npm
alias npb='npm run build'
alias nps='npm run start'

# system updates & upgrades
alias up='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove && sudo apt clean'
alias upp='up && sudo apt dist-upgrade -y'

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

#
# docker
#

# docker-compose
alias dcup='cd ~/docker && docker-compose up -d --remove-orphans' #;compdef dcs='docker'
alias dcstop='cd ~/docker && docker-compose stop' #;compdef dcstop='docker stop '
alias dcrestart='cd ~/docker && docker-compose restart' #;compdef dcrestart='docker restart '
alias dcdown='cd ~/docker && docker-compose down' #;compdef dcdown='docker down'
alias dcinfo='docker system df'

# list all dockers
alias dps='docker ps -a \
  --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}" \
  | (read -r; printf "%s\n" "$REPLY"; sort -k 2  )'
alias dnet='docker network ls'

# clean up docker system
alias dclean='docker system prune --volumes'
alias dclean='dcleani && dcleane'
alias dcleani='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias dcleane='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'

# stop all containres
alias dcstopall='docker stop $(docker ps -a -q)'

# remove unused: containers | vol | networks | etc
alias dcnukeold='docker system prune -af'

# remove nfs share volumes
alias dcnukev='docker volume rm $(docker volume ls | grep docker_)'

# remove all containers
alias dcnukec='docker rm $(docker ps -a -q)'

# remove all images
alias dcnukei='docker rmi $(docker images -a -q)'

# nuke ALL: containers | volumes | images
alias dcnukeall='dcstopall ; dcnukec ; dcnukei ; dcnukev'


