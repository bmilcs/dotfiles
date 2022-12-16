# shortcuts: dotfile related
alias ali="vim ~/.bash_aliases"
alias brc="vim ~/.bashrc"
alias brs="source ~/.bashrc"
alias dfi="(cd $DOT && ./install.sh)"
alias dfe="vim $DOT/install.sh"
alias i3e="vim $DOT/i3/.config/i3/config"

# ssh keygen
alias sshgen="ssh-keygen -t ed25519 -C bmilcs@yahoo.com"

# vim default: lvim > nvim > vim > vi
alias vim="vi"
if command -v lvim >/dev/null; then 
  alias vi='lvim'
elif command -v nvim >/dev/null; then 
  alias vi='nvim'
elif command -v vim >/dev/null; then 
  alias vi='vim' 
fi

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
alias npt='npm run test'

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
