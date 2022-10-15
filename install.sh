#!/usr/bin/env bash

# bmilcs dotfiles

#
# configuration
#

# dotfile path
export DOT="$HOME"/repos/dotfiles

backupPath="$HOME"/.backup

# dependencies
packages=(
	curl 
	wget 
	neovim 
	git 
	stow)

# stow paths: current user only
currentUser=(
	bash
	nvim
)

# stow paths: root & normal users
allUsers=(
	git
)

#
# install dependencies
#

echo "installing dependencies"
for i in "${packages[@]}"
do
  # if command doesn't exist
  if ! [ -x "$(command -v $i)" ]; then
    echo "- installing $i"
    sudo apt-get -y install $i
  else
    echo "- $i already installed"
  fi
done

#
# stow / symlink dotfiles
#

# runs stow command, destination: $1, source to stow: $2
stowIt() {
	destination=$1
	sourcePath=$2

	# --adopt overwrites existing files * destructive
	# -v verbose
	# -R restow
	# -t target
	conflict=$(stow -v -R --adopt -t ${destination} ${sourcePath} 2>&1 \
		| awk '/\* existing target is/ {print $NF}')
	if [[ ! -z $conflict ]]; then
		echo "* conflicts found: ${conflict}"
		echo "moving conflicts to ${backupPath}"
		mkdir -p "$backupPath"

	for filename in ${CONFLICTS[@]}; do
		if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
			echo "BACKING UP: $filename"
			mv "$HOME/$filename" $backupPath
		fi
	done
	fi
}

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

