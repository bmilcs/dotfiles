#!/usr/bin/env bash

# bmilcs dotfiles v3.0 [10/2022]

# paths
export DOT="$HOME"/repos/dotfiles
export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$HOME/.config/oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
backupPath="$HOME"/.backup

# dependencies
packages=(
  git
  stow
  ncdu
  nfs-common
  fd-find
  ripgrep
  tmux
)

devPackages=(
  # i3-gaps
  alacritty
)

# dotfiles paths to install (via symlink with stow utility)

currentUser=(
  alacritty
  bash
  bin
  zsh
  # nvim
)

allUsers=(
  git
)

#
# utility functions
#

# installs packages from an array of package names
installFromArray() {
  packagesArray=($@)
  for i in "${packagesArray[@]}"; do
    # if command doesn't exist
    if ! [ -x "$(command -v $i)" ]; then
      echo "- installing $i"
      sudo apt-get -y install $i &&
        echo "done"
    else
      echo "- $i already installed"
    fi
  done
}

# installs dotfiles via symlink with stow utility, $1 destination, $2 source
stowIt() {
  destination=$1
  folder=$2

  mkdir -p $backupPath

  echo "Stowing $folder..."

  # Use the --adopt option to move conflicting files to ~/backup
  stow -v4 --adopt -t "$destination" "$folder"
}

#
# install web dev stuff
#

# build neovim from source
buildNeovim() {
  read -p "Build Neovim? (y/n) "
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo 'cloning repo'
    git clone https://github.com/neovim/neovim ~/repos/neovim
    # dependencies
    echo 'installing deps'
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    git clone https://github.com/neovim/neovim ~/repos/neovim --depth=1
    cd ~/repos/neovim &&
      make CMAKE_BUILD_TYPE=Release &&
      sudo make install
  fi
}

# build i3 gaps
buildI3Gaps() {
  read -p "Build i3 gaps? (y/n) "
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    destination=~/repos/i3-gaps
    cd "$destination" || git clone https://github.com/Airblader/i3 "$destination"
    sudo apt install meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev
    cd "$destination"
    mkdir -p build && cd build
    meson --prefix /usr/local
    ninja
    sudo ninja install
  fi
}

# install fonts from resources/fonts
installFonts() {
  read -p "Install fonts?"
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    fontsPath=~/.local/share/fonts/
    mkdir -p "$fontsPath"
    cd ./resources/fonts &&
      cp * "$fontsPath" &&
      # clear & regenerate font cache
      fc-cache -f -v
  fi
}

# zsh Setup
setupZSH() {
  if [ ! -f "${ZDOTDIR:-$HOME/.config/zsh}/.antidote}" ]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR:-$HOME}/.antidote"
  fi
  if [ ! -f "${ZSH:-$HOME/.config/oh-my-zsh}" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
  if [ ! -f "${ZSH_CUSTOM:-$HOME/.config/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  fi
}

installAlacritty() {
  read -p "Install Alacritty?"
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    # alacritty repo
    sudo add-apt-repository ppa:aslatter/ppa
    sudo apt update && sudo apt install -y alacritty
  fi
}

installPackages() {
  read -p "Install packages?"

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "sudo apt update"
    sudo apt update -y

    echo "installing dependencies"
    installFromArray ${packages[@]}

    echo "zsh setup: oh-my-zsh, powerlevel10k, antidote"
    setupZSH
  fi
}

installDotfiles() {
  read -p "Install dotfiles?"

  if [[ $REPLY =~ ^[Yy]$ ]]; then

    mkdir -p $ZDOTDIR

    # install root & normal user stuff
    for app in ${allUsers[@]}; do
      stowIt "${HOME}" "${app}"
    done

    # install current user stuff only
    for app in ${currentUser[@]}; do
      if [ "$EUID" -ne 0 ]; then
        stowIt "${HOME}" "${app}"
      fi
    done
  fi
}

installDotfiles
installPackages
installAlacritty
buildI3Gaps
buildNeovim
installFonts
