#!/bin/bash

# execute this from the top directory of the dotfiles repository
INSTALLDIR=`/bin/pwd`
[ ! -e $INSTALLDIR/duncombe/bashrc ] && {
	echo "dotfiles repository does not appear to be here ($INSTALLDIR)" 
	echo exit 1
	}

# make space to include the bash-git-prompt as a submodule and do this all in one loop
for f in bash-git-prompt duncombe/{bashrc,bash_logout,bash_profile,bashrc_custom,vimrc} ; do
	[ ! -e ~/.${f}\~ ] &&
		ln -sb "$INSTALLDIR/${f}" ~/.$(basename ${f})  ||
			echo  ~/.${f}\~ exists.
done

# for git config, should try this. It will work! :
# ln -sb ~/dotfiles/duncombe/gitconfig_extras .gitconfig_extras
# if [ ! -e .gitconfig ]; then
# 	cp -i ~/dotfiles/duncombe/gitconfig ~/.gitconfig
# else
## a job for sed or awk
##  grep local ~/.gitconfig for "include .gitconfig_extras" 
##  if it's not there add the line.
# 

## not required
# ln -sb ~/dotfiles/duncombe/fetchmailrc .fetchmailrc
# ln -sb ~/dotfiles/duncombe/muttrc .muttrc
# ln -sb ~/dotfiles/duncombe/procmailrc .procmailrc

# vim: se nowrap tw=0 : 
