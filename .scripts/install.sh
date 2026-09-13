#
# bmilcs dotfiles v4 installation script
#

# helper files
BASE_PATH="$(dirname "$(dirname "$(realpath "${BASH_SOURCE[0]}")")")"
PACKAGE_LIST="$BASE_PATH/.scripts/.packages"
source "$BASE_PATH/.scripts/.global_variables"
source "$BASE_PATH/.scripts/.functions"

# begin
echo "--------------------------------"
echo "- bmilcs dotfiles installation -"
echo "--------------------------------"

# arch setup
if ask_yes_no "configure core components?"; then
	# install base packages
	sudo pacman -S --needed --noconfirm $(grep -v '^#' $PACKAGE_LIST) &&
	echo "- core components installed"

	# install yay
	if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git &&
 		  cd yay &&
      makepkg -si	&&
      echo "- yay installed"
	fi

	# enable ssh
	sudo systemctl enable --now sshd &&
	  echo "- sshd enbled"

	# install font
	sudo mkdir -p /usr/share/fonts &&
	  sudo cp -r $BASE_PATH/.resources/fonts/* /usr/share/fonts &&
	  echo "- font installed"

  # install icons
  sudo mkdir -p /usr/share/icons &&
	  sudo cp -r $BASE_PATH/.resources/icons/* /usr/share/icons &&
	  echo "- icons installed"

  # install gtk themes
  sudo mkdir -p /usr/share/themes /usr/share/qtcreator/styles /usr/share/qtcreator/themes &&
    # gtk
    sudo cp -r $BASE_PATH/.resources/themes/gtk/* /usr/share/themes &&
    # qt 
    echo "- themes installed"


fi

# curseforge
if ask_yes_no "install curseforge?"; then
	mkdir -p ~/.bin &&
    wget -O ~/.bin/curseforge.AppImage https://curseforge.overwolf.com/downloads/curseforge-latest-linux.AppImage && 
    chmod +x ~/.bin/curseforge.AppImage
fi

# zen browser
if ask_yes_no "install zen browser?"; then
	yay -S zen-browser-bin
fi
