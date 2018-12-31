#!/usr/bin/env bash

install_zsh () { 
	# Test to see if zshell is installed.  If it is: 
	if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then     
		# Set the default shell to zsh if it isn't currently set to zsh     
		if [[ ! $(echo $SHELL) == $(which zsh) ]]; then         
			chsh -s $(which zsh)     
		fi 
	else
	    echo "Please install zsh, then re-run this script!"         
	fi 
 
}  

install_zsh
