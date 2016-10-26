#!/bin/bash

# execute this from the top directory of the dotfiles repository
INSTALLDIR=`/bin/pwd`
[ ! -e $INSTALLDIR/duncombe/bashrc ] && {
	echo "dotfiles repository does not appear to be here ($INSTALLDIR)" 
	echo exit 1
	}

# Make space to include the bash-git-prompt as a submodule and do this all in
# one loop. Make backups. If a backup already exists, skip the copy.
# For the bash-git prompt, it is a submodule. How do you fetch out also the
# submodules when you clone the repo??  If the bash-git-prompt dir is empty,
# clone the bash-git-prompt repo. If when you are using the bash-git-prompt,
# there are weird characters in the prompt, check the terminal encoding (menu
# Terminal->Set Character Encoding) and change it to UTF-8.

for f in bash-git-prompt duncombe/{\
bash_logout,\
bash_profile,\
bashrc,\
bashrc_custom,\
bashrc_minimalist,\
gitconfig_extras,\
gvimrc,\
inputrc,\
muttmailcap,\
muttrc,\
viewrc,\
vimrc\
} ; do
	# if no backup file exists, make a link. if a backup file exists, complain.
	[ ! -e ~/.${f}\~ ] &&
		ln -svb "$INSTALLDIR/${f}" ~/.$(basename ${f})  ||
			echo  Backup file ~/.${f}\~ exists.
done

# for git config, should try this. It will work! :
##### above # ln -sb ~/dotfiles/duncombe/gitconfig_extras ~/.gitconfig_extras
if [ ! -e ~/.gitconfig ]; then
	cp -i "${INSTALLDIR}/duncombe/gitconfig" ~/.gitconfig
else
## a job for sed or awk
	if ! grep ".gitconfig_extras" ~/.gitconfig > /dev/null ; then
		 awk '	BEGIN{printon=0}
			/^\[/{printon=0}
			/^\[include\]/{printon=1} 
			printon{print}
			' ${INSTALLDIR}/duncombe/gitconfig >>  ~/.gitconfig
	fi
fi

# something special for local only bash commands
[ ! -e ~/.bashrc_local ] && cp duncombe/bashrc_local ~/.bashrc_local

if [ ! -e ~/.git-completion.bash ]; then 
	wget -q -O- https://raw.github.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
# 	GIT_COMPLETIONFILE=`locate git-completion.bash`
# 	if [ `echo $GIT_COMPLETIONFILE| wc -w` -eq 1 ] ; then 
# 		ln -s $GIT_COMPLETIONFILE ~/.git-completion.bash
# 	else
# 		echo git completion file cannot be identified
# 	fi
fi

## these may be installation specific. Check above automated stuff.
# ln -sb ~/dotfiles/duncombe/fetchmailrc .fetchmailrc
# ln -sb ~/dotfiles/duncombe/muttrc .muttrc
# ln -sb ~/dotfiles/duncombe/procmailrc .procmailrc

# vim: se nowrap tw=0 : 

