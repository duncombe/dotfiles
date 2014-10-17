#!/bin/bash


for f in bashrc bash_logout bash_profile bashrc_custom vimrc ; do
	[ ! -e ~/.${f}\~ ] &&  ln -sb ~/dotfiles/duncombe/${f} ~/.${f}  || echo  ~/.${f}\~ exists.
done


## not required
# ln -sb ~/dotfiles/duncombe/fetchmailrc .fetchmailrc
# ln -sb ~/dotfiles/duncombe/muttrc .muttrc
# ln -sb ~/dotfiles/duncombe/procmailrc .procmailrc
