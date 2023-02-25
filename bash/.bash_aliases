# sudo trick
alias sudo='sudo '

# shortcuts: dotfile related
alias ali="vim ~/.bash_aliases"
alias brc="vim ~/.bashrc"
alias brs="source ~/.bashrc"
alias dfi="(cd $DOT && ./install.sh)"
alias dfe="vim $DOT/install.sh"
alias i3e="vim $DOT/i3/.config/i3/config"
alias sshe="vim ~/.ssh/config"
alias zsr="source ~/.zshrc"

# ssh keygen
alias sshgen="ssh-keygen -t ed25519 -C bmilcs@yahoo.com"

# vim default: lvim > nvim > vim > vi
if command -v lvim >/dev/null; then 
  alias vim_alias='lvim'
elif command -v nvim >/dev/null; then 
  alias vim_alias='nvim'
elif command -v vim >/dev/null; then 
  alias vim_alias='vim' 
fi

# prevent sudo vi/vim from ignoring the alias above
alias svim="sudo vim_alias"
alias vim="vim_alias"
alias svi="sudo vim_alias"

# git
alias gppr='if [ -z "$(git status --porcelain)" ]; then \
            npm run build && \
            git add -A && \
            git commit -m "Build updates to build/" && \
            git push && \
            git subtree push --prefix build origin build; \
          fi'
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
alias gcma='git commit --amend'
alias ga='git add'
alias gaa='ga --all'
alias gl='git log --oneline --color --graph'
alias gll='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grs='git reset'
alias grshard='git reset --hard'
alias grshead='git reset --head'
alias uprepos='
cd "~/repos"

# Loop through all subdirectories in the path
for d in */ ; do
    # Change to the subdirectory
    cd "$d"

    # Pull updates from the git repository
    git pull

    # Change back to the path directory
    cd ..
done

'

# npm
alias npb='npm run build'
alias nps='npm run start'
alias npd='npm run dev'
alias npt='npm run test'

# system updates & upgrades
alias up='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove && sudo apt clean'
alias upp='up && sudo apt dist-upgrade -y'

# ls: long form
alias ls='LC_ALL=C ls -AlhF --color=auto --group-directories-first \
  --time-style="+%D %H:%M"'

# ls
alias l='ls'

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
alias dcup='cd ~/docker && docker-compose pull && docker-compose up --detach --remove-orphans' #;compdef dcs='docker'
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


