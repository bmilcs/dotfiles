# 
# bmilcs dotfiles v4 installation script
#

# helper files
BASE_PATH="$(dirname "$(dirname "$(realpath "${BASH_SOURCE[0]}")")")"
source "$BASE_PATH/.scripts/.global_variables"
source "$BASE_PATH/.scripts/.functions"

# begin
echo "--------------------------------"
echo "- bmilcs dotfiles installation -"
echo "--------------------------------"

# arch setup
if ask_yes_no "configure core components?"; then
	# install base packages
	sudo pacman -Syu --noconfirm sudo openssh less kitty neovim wl-clipboard dolphin firefox wget hyprcursor hyprlauncher hyprpaper hyprtoolkit git base-devel debugedit grim slurp swappy &&
	echo "- core components installed"

	# install yay
	if ! command -v yay &> /dev/null; then
  		git clone https://aur.archlinux.org/yay.git
 		cd yay
        	makepkg -si	
	fi

	# enable ssh
	sudo systemctl enable --now sshd &&
	echo "- sshd enbled"

	# install font
	sudo mkdir -p /usr/share/fonts &&
	sudo cp -r $BASE_PATH/.resources/fonts /usr/share/fonts &&
	echo "- font installed"
fi

# curseforge
if ask_yes_no "install curseforge?"; then
	mkdir -p ~/.bin && wget -O ~/.bin/curseforge.AppImage https://curseforge.overwolf.com/downloads/curseforge-latest-linux.AppImage && chmod +x ~/.bin/curseforge.AppImage
fi


# zen browser
if ask_yes_no "install zen browser?"; then
	yay -S zen-browser-bin
fi
