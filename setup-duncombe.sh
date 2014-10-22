#!/bin/bash

# execute this from the top directory of the dotfiles repository
INSTALLDIR=`/bin/pwd`
[ ! -e $INSTALLDIR/duncombe/bashrc ] && {
	echo "dotfiles repository does not appear to be here ($INSTALLDIR)" 
	echo exit 1
	}

for f in bashrc bash_logout bash_profile bashrc_custom vimrc ; do
	[ ! -e ~/.${f}\~ ] &&
		ln -sb "$INSTALLDIR/duncombe/${f}" ~/.${f}  ||
			echo  ~/.${f}\~ exists.
done


## not required
# ln -sb ~/dotfiles/duncombe/gitconfig .gitconfig
# ln -sb ~/dotfiles/duncombe/fetchmailrc .fetchmailrc
# ln -sb ~/dotfiles/duncombe/muttrc .muttrc
# ln -sb ~/dotfiles/duncombe/procmailrc .procmailrc
