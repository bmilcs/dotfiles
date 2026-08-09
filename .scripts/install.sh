# 
# bmilcs dotfiles v4 installation script
#

# helper files
source "$HOME/.scripts/.global_variables"
source "$HOME/.scripts/.functions"

# begin
echo "--------------------------------"
echo "- bmilcs dotfiles installation -"
echo "--------------------------------"

# arch setup
if ask_yes_no "Install core components?"; then
	sudo pacman -Syu --noconfirm sudo openssh kitty dolphin firefox
	echo "- core components installed"

	# enable ssh
	sudo systemctl enable --now sshd
	echo "- sshd enbled"
fi

# user setup
# visudo -- uncomment wheel group
# usermod group wheel

