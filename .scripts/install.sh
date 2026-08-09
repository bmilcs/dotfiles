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

# arch packages needed
ask_yes_no("Install sudo and openssh?");
then
	pacman -Syu sudo openssh
fi

# enable ssh
# sudo systemctl enable --now sshd

# visudo -- uncomment wheel group


