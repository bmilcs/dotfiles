#!/usr/bin/env bash

# bmilcs dotfiles

#
# configuration
#

# paths
export DOT="$HOME"/repos/dotfiles
backupPath="$HOME"/.backup

# global dependencies
packages=(
	curl
	wget
	git
	stow
)

# dev dependencies
devPackages=(
  alacritty
)

# configs to be installed (symlinked with stow utility)
currentUser=(
	bash
	nvim
  alacritty
)

allUsers=(
	git
)


# 
# utility functions
#

# installs packages from an array of package names
function installFromArray() {
  array=($@)
  for i in "${array[@]}"; do
    # if command doesn't exist
    if ! [ -x "$(command -v $i)" ]; then
      echo "- installing $i"
      sudo apt-get -y install $i && \
        echo "done"
    else
      echo "- $i already installed"
    fi
done
}

# installs dotfiles via symlink with stow utility, $1 destination, $2 source
stowIt() {
	destination=$1
	sourcePath=$2

	# -v verbose
	# -R restow
	# -t target
  
  # executes stow & if error, catches package name into "conflict" variable
	conflict=$(stow -v -R --adopt -t ${destination} ${sourcePath} 2>&1 |
		awk '/\* existing target is/ {print $NF}')

  # if error occured, attempt to back up the conflict
	if [[ ! -z $conflict ]]; then
		echo "conflicts found: ${conflict}"
		echo "- moving conflicts to ${backupPath}"
		mkdir -p "$backupPath"

		for filename in ${CONFLICTS[@]}; do
			if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
				echo "BACKING UP: $filename"
				mv "$HOME/$filename" $backupPath && \
          echo "Backup successful. Re-run script to stow it again"
			fi
		done
	fi
}

#
# install dependencies
#

echo "sudo apt update"
sudo apt update -y

echo "installing dependencies"
installFromArray ${packages[@]}


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

#
# install web dev stuff
#

# build neovim from source
buildNeovim() {
  read -p "Build Neovim? It takes a while!"
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    # dependencies
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    git clone https://github.com/neovim/neovim ~/repos/neovim --depth=1
    cd ~/repos/neovim &&
      make CMAKE_BUILD_TYPE=RelWithDebInfo &&
      sudo make install
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

read -p "Setup DEV Environment?"

if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "installing dev packages"
  # alacritty repo
  sudo add-apt-repository ppa:aslatter/ppa
  installFromArray ${devPackages[@]}
	installFonts
	buildNeovim
fi
