#!/bin/bash

# execute this from the top directory of the dotfiles repository
INSTALLDIR=`/bin/pwd`
[ ! -e $INSTALLDIR/duncombe/bashrc ] && {
	echo "dotfiles repository does not appear to be here ($INSTALLDIR)" 
	echo exit 1
	}

# make space to include the bash-git-prompt as a submodule and do this all in
# one loop. Make backups. If a backup already exists, skip the copy.
# For the bash-git prompt, it is a submodule. How do you fetch out also the
# submodules when you clone the repo??  If the bash-git-prompt dir is empty,
# clone the bash-git-prompt repo. If when you are using the bash-git-prompt,
# there are weird characters in the prompt, check the terminal encoding (menu
# Terminal->Set Character Encoding) and change it to UTF-8.
for f in bash-git-prompt duncombe/{bashrc,bash_logout,bash_profile,bashrc_custom,vimrc} ; do
	[ ! -e ~/.${f}\~ ] &&
		ln -sb "$INSTALLDIR/${f}" ~/.$(basename ${f})  ||
			echo  Backup file ~/.${f}\~ exists.
done

# for git config, should try this. It will work! :
# ln -sb ~/dotfiles/duncombe/gitconfig_extras ~/.gitconfig_extras
# if [ ! -e .gitconfig ]; then
# 	cp -i "${INSTALLDIR}/duncombe/gitconfig" ~/.gitconfig
# else
## a job for sed or awk
# 	if grep ".gitconfig_extras" ~/.gitconfig 
# 		 "include .gitconfig_extras" 
##  if it's not there add the line.
# fi

# something special for local only bash commands
[ ! -e ~/.bashrc_local ] && cp duncombe/bashrc_local ~/.bashrc_local


## not required
# ln -sb ~/dotfiles/duncombe/fetchmailrc .fetchmailrc
# ln -sb ~/dotfiles/duncombe/muttrc .muttrc
# ln -sb ~/dotfiles/duncombe/procmailrc .procmailrc

# vim: se nowrap tw=0 : 

