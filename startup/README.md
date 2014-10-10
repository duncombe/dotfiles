dotfiles.git
============
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure your `bash` and `emacs` development environment as follows:

```sh
cd $HOME
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/screenrc .screenrc
ln -sb dotfiles/bash_profile .bash_profile
ln -sb dotfiles/bashrc .bashrc
ln -sb dotfiles/bashrc_custom .bashrc_custom
mv .emacs.d .emacs.d~
ln -s dotfiles/emacs.d .emacs.d
```

See also http://github.com/duncombe/setup to install prerequisite
programs. If all goes well, in addition to a more useful prompt, now you can
do `emacs -nw hello.js` and hitting `C-c!` to launch an interactive SSJS
REPL, among many other features. See the
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.

Note this scheme is changed form the original by making the files that will be hidden in 
the HOME directory, visible in the dotfiles/ directory.

